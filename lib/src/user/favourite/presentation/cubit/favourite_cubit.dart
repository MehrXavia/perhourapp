import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/utils/helper_methods.dart';
 import '../../../../shared/auth/data/models/profile_dto.dart';
import '../../../service_user/data/models/AddNotificationPrams.dart';
import '../../../service_user/data/repositories/service_user_repo.dart';
import '../../data/models/FavouritePrams.dart';
import '../../data/repositories/favourite_repo.dart';

@Injectable()
class FavouriteCubit extends BaseCubit {
  final FavouriteRepository _repository;
  final ServiceUserRepository repository;
  FavouriteCubit(this._repository, this.repository);

  addFavourite(FavouritePrams favouritePrams) {
    executeEmitterListener(() => _repository.addFavourite(  favouritePrams: favouritePrams));
  }

  getFavourite( ) async {
    ProfileDto?  data =await HelperMethods.getProfile();
    executeSuccess(
      () => _repository.fetchFavourite(
         userId: data?.id??0,
      ),
    );
  }

  deleteFavourite(int favouriteId) {
    executeEmitterSuccess(
          () => _repository.deleteFavourite(
            favouriteId: favouriteId,
      ),
    );
  }

  void addNotification(
      {required int notificationsTypeId,
        required int serviceProviderId}) async {
    int userId = await HelperMethods.getUserId();
    DateTime now = DateTime.now() ;
    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
    executeEmitterSuccess(
          () => repository.addNotification(
        addNotificationPrams: AddNotificationPrams(
            serviceProviderId: serviceProviderId,
            userId: userId,
            notificationsTypeId: notificationsTypeId,
            dateNotification: formattedDate,
            id: 0),
      ),
    );
  }


}
