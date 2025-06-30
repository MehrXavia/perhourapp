import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../shared/auth/data/models/profile_dto.dart';
import '../../data/models/AddSubsriptionsPrams.dart';
import '../../data/repositories/all_subscription_repo.dart';

@Injectable()
class SubscriptionsCubit extends BaseCubit {
  final SubscriptionRepository _repository;

  SubscriptionsCubit(this._repository);

  getAllSubscription() {
    executeSuccess(
      () => _repository.fetchGetAllSubscription(),
    );
  }

  getSubscription() async {
    ProfileDto? dataUser = await HelperMethods.getProfile();

    executeSuccess(
      () => _repository.fetchSubscription(
          serviceProviderId: dataUser?.id ?? 0),
    );
  }

  loadingData() async {
    ProfileDto? dataUser = await HelperMethods.getProfile();
    executeDoubleSuccess(
        () => _repository.fetchGetAllSubscription(),
        () => _repository.fetchSubscription(
            serviceProviderId: dataUser?.id ?? 0));
  }

  addSubscription(AddSubsriptionsPrams addSubscriptionsPrams) {
    executeEmitterListener(() => _repository.addSubscription(
        addSubscriptionsPrams: addSubscriptionsPrams));
  }
}
