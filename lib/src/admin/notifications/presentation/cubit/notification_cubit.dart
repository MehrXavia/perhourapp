import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../shared/auth/data/models/profile_dto.dart';
import '../../data/models/NotificationsDto.dart';
import '../../data/repositories/notifications_repo.dart';

@Injectable()
class NotificationCubit extends BaseCubit {
  final NotificationsRepository _repository;

  NotificationCubit(this._repository);
  StreamStateInitial<List<NotificationsDto>> streamData = StreamStateInitial();

  getNotifications({  required int contactType}) async {

      ProfileDto?  data =await HelperMethods.getProfile();
    executeSuccess(
      () => _repository.fetchGetNotifications(
          serviceProviderId: data?.id??0, ContactType: contactType),
    );
  }

  getNotificationsStream(
      {  required int contactType}) async {
    try {
      ProfileDto?  dataUser =await HelperMethods.getProfile();
      final data = await _repository.fetchGetNotifications(
          serviceProviderId: dataUser?.id??0, ContactType: contactType);
      streamData.setData(data);
    } catch (e) {
      streamData.setError(e);
    }
  }
}
