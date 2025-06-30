import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../../core/bloc/base_cubit.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../favourite/data/models/FavouritePrams.dart';
import '../../../../favourite/data/repositories/favourite_repo.dart';
import '../../../data/models/AddNotificationPrams.dart';
import '../../../data/models/ServiceProviderMarker.dart';
import '../../../data/models/Service_marker_dto.dart';
import '../../../data/models/Service_marker_params.dart';
import '../../../data/repositories/service_user_repo.dart';

@Injectable()
class MarkerMapCubit extends BaseCubit {
  final ServiceUserRepository _repository;
  final FavouriteRepository _favouriteRepository;

  MarkerMapCubit(this._repository, this._favouriteRepository);
  StreamState<List<ServiceProviderMarker>?> serviceMarkerStream =
      StreamStateInitial();
  StreamStateInitial<bool> isFavoriteStream = StreamStateInitial();
  fetchSubService(
      {required int idService, required double lat, required double lon, required String countryCode}) async {

    int userId = await HelperMethods.getUserId();
    executeSuccess(() {
      return _repository.fetchSubService(
        idService: idService,
      );
    }, onSuccess: (data) {
      fetchServiceMarkerStream(
          serviceMarkerParams: ServiceMarkerParams(
              serviceId: data.first.id, lat: lat, lon: lon,userId:userId,countryCode: countryCode ));
    });
  }

  fetchServiceMarker({required ServiceMarkerParams serviceMarkerParams}) async {
    int userId = await HelperMethods.getUserId();
    serviceMarkerParams.userId=userId;
    executeSuccess(
      () => _repository.fetchUserLocation(
          serviceMarkerParams: serviceMarkerParams),
    );
  }

  fetchServiceMarkerStream(
      {required ServiceMarkerParams serviceMarkerParams}) async {
    try {
      serviceMarkerStream.setData(null);
      int userId = await HelperMethods.getUserId();
      serviceMarkerParams.userId=userId;
      final data = await _repository.fetchUserLocation(
          serviceMarkerParams: serviceMarkerParams);
      serviceMarkerStream.setData(data);
    } catch (e) {
      print(e);
      print("lklmllllk");
      serviceMarkerStream.setError(e);
    }
  }

  void addFavourite({required int serviceProviderId, required int subServiceId}) async {
    int userId = await HelperMethods.getUserId();
    String  date=  DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(DateTime.now());

    executeEmitterListener(
        () => _favouriteRepository.addFavourite(
              favouritePrams: FavouritePrams(
                serviceProviderId: serviceProviderId,
                createdDate: date,
                userId: userId,
                subServiceId: subServiceId,
              ),
            ), onSuccess: (data) {
      isFavoriteStream.setData(true);
    });
  }

  void addNotification(
      {required int notificationsTypeId,
      required int serviceProviderId}) async {
    int userId = await HelperMethods.getUserId();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    executeEmitterSuccess(
      () => _repository.addNotification(
        addNotificationPrams: AddNotificationPrams(
            serviceProviderId: serviceProviderId,
            userId: userId,
            notificationsTypeId: notificationsTypeId,
            dateNotification: formattedDate,
            id: 0),
      ),
    );
  }

  void deleteFavourite(int id) async {
    executeEmitterListener(
        () => _favouriteRepository.deleteFavourite(
              favouriteId: id,
            ), onSuccess: (data) {
      isFavoriteStream.setData(false);
    });
  }
}
