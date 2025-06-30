import 'package:injectable/injectable.dart';
import 'package:onservice24/src/admin/subscriptions/data/repositories/all_subscription_repo.dart';

import '../../../../../../core/bloc/base_cubit.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../subscriptions/data/models/AddSubsriptionsPrams.dart';



@Injectable()
class  PaymentCubit extends BaseCubit {
  final SubscriptionRepository _repository;

  PaymentCubit(this._repository);



  addSubscription(AddSubsriptionsPrams addSubscriptionsPrams) async {
    int userId = await HelperMethods.getUserId();
    addSubscriptionsPrams.serviceProviderId=userId;
    executeEmitterSuccess(() => _repository.addSubscription(
        addSubscriptionsPrams: addSubscriptionsPrams));
  }



}
