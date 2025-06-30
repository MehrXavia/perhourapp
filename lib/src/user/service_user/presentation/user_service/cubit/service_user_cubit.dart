import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:onservice24/core/commen/common_state.dart';

import '../../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../admin/service/data/repositories/service_repo.dart';
import '../../../data/models/ServiceUserDto.dart';
import '../../../data/models/service_prams.dart';
import '../../../data/repositories/service_user_repo.dart';

@Injectable()
class ServiceUserCubit extends BaseCubit {
  final ServiceUserRepository _repository;
  final ServiceRepository serviceRepository;

  ServiceUserCubit(this._repository, this.serviceRepository);
  StreamState<List<ServiceUserDto>> serviceStream = StreamStateInitial();

  fetchServiceStream({required ServicePrams servicePrams}) async {
    try {
      final data = await _repository.fetchService(
        servicePrams: servicePrams,
      );
      serviceStream.setData(data);
    } catch (e) {
      serviceStream.setError(e);
    }
  }

  Future<Position> determinePosition() async {
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

  Future<String?> getCountryFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
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

  loadInitialData() async {
    try {
      emit(DataLoading());
      final sliderData = await serviceRepository.fetchAdvertisement();

      Position position = await determinePosition();
      LatLng latLng = LatLng(position.latitude, position.longitude);
      String? countryCode =
          await getCountryFromLatLng(position.latitude, position.longitude);
      final serviceData = await _repository.fetchService(
        servicePrams: ServicePrams(countryCode: countryCode, lat: 0, lon: 0),
      );

      emit(HomeUserData(
          sliderData: sliderData,
          latlng: latLng,
          serviceData: serviceData,
          countryCode: countryCode ?? "SA"));
    } catch (e) {
      emit(DataFailed(e));
    }
  }
}
