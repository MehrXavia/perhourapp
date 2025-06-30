import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/src/admin/subscriptions/presentation/pages/subscriptions_screen.dart';

import '../../../../main_index.dart';
import '../cubit/subscriptions_cubit.dart';

class SubscriptionsPage
    extends BaseBlocWidget<DoubleDataSuccess, SubscriptionsCubit> {
  @override
  String? title(BuildContext context) {
    return strings.subscriptions;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.loadingData();
  }


  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    return SubscriptionsScreen(
      data2: state.data2??[],
      data1: state.data1 ?? [],
      addSubsriptions: (addSubscriptionsPrams) {
        bloc.addSubscription(addSubscriptionsPrams);
      },
    );
  }

  @override
  bool? isDrawer(BuildContext context) {
    return false;
  }
  @override
  void onSuccessDismissed() {
    bloc.loadingData();
  }
}
