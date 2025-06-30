import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../admin/service/data/repositories/service_repo.dart';
import '../../../../../shared/auth/data/models/profile_dto.dart';
import '../../../../../shared/auth/domain/use_cases/auth_usecase.dart';
import '../../../../../user/service_user/data/models/AddNotificationPrams.dart';
import '../../../../../user/service_user/data/repositories/service_user_repo.dart';
import '../../../data/models/EditProfilePrams.dart';
import '../../../data/repositories/profile_repo.dart';

@Injectable()
class ProfileServiceProviderCubit extends BaseCubit {
  final ProfileRepository _repository;
  final ServiceRepository _serviceRepository;
  final ServiceUserRepository _serviceUserRepository;
  final AuthUseCase usecase;
  ProfileServiceProviderCubit(this._serviceUserRepository, this._repository,
      this._serviceRepository, this.usecase);

  getProfile() async {
    int userId = await HelperMethods.getUserId();
    executeSuccess(
      () => _repository.fetchProfile(
        id: userId,
      ),
    );
  }

  editProfile(EditProfilePrams editProfileParams) async {
    ProfileDto? data = await HelperMethods.getProfile();

    editProfileParams.id = data?.id ?? 0;
    editProfileParams.loginDate = data?.loginDate  ;
    editProfileParams.logoutDate = data?.logoutDate ;
    editProfileParams.isLogedOut = data?.isLogedOut  ;

    executeEmitterListener(
        () => _repository.editProfile(editProfileParams: editProfileParams));
  }

  loadInitialData({required int serviceProviderId}) async {
    executeDoubleSuccess(
        () => _repository.fetchProfile(
              id: serviceProviderId,
            ),
        () => _serviceRepository.getService(id: serviceProviderId),
        onSuccess: () async {
      int userId = await HelperMethods.getUserId();

      addNotification(
          notificationsTypeId: 1,
          serviceProviderId:
               serviceProviderId  );
    });
  }

  void addNotification(
      {required int notificationsTypeId,
      required int serviceProviderId}) async {
    int userId = await HelperMethods.getUserId();
    DateTime now = DateTime.now() ;
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    executeEmitterSuccess(
      () => _serviceUserRepository.addNotification(
        addNotificationPrams: AddNotificationPrams(
            serviceProviderId: serviceProviderId ?? 0,
            userId: userId == 0 || userId == null ? 0 :userId,
            notificationsTypeId: notificationsTypeId ?? 1,
            dateNotification: formattedDate,
            id: 0),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Geolocator.openAppSettings();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Geolocator.openAppSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
  Future<String?> getCountryFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        print("country: ${placemarks.first.country}");
        print("isoCountryCode: ${placemarks.first.isoCountryCode}");
        return placemarks.first.isoCountryCode; // Get the country name
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
  getLocation() async {
    executeBuilder(() => _determinePosition(), onSuccess: (position) {
      LatLng currentLocation;
      double lat = position.latitude;
      double long = position.longitude;
      getCountryFromLatLng(lat, long);
      LatLng location = LatLng(lat, long);
      currentLocation = location;
      emit(DataSuccess<LatLng>(currentLocation));
    });
  }

  uploadImageAndEditProfile(
      File? file, EditProfilePrams editProfileParams) async {
    try {
      emit(LoadingStateListener());

      if (file != null) {
        final id = await usecase.uploadImage(file);
        editProfileParams.photoId = id;
      }
      final data =
          await _repository.editProfile(editProfileParams: editProfileParams);
      emit(SuccessStateListener(data));
    } on Exception catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
