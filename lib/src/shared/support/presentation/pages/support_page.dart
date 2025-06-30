import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/src/shared/support/presentation/pages/support_screen.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../navigation_pages_v2.dart';
import '../../../../main_index.dart';
import '../bloc/support_bloc.dart';

class SupportPage extends BaseBlocWidget<UnInitState, SupportCubit> {
  SupportPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return SupportScreen(
      onContactUs: (params) {
        bloc.contactSupport(params);
      },
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.help_support;
  }

  @override
  void onSuccessDismissed() {
    Navigator.pop(kContext);
  }

  @override
  bool? isBackHome(BuildContext context) {
    return  false;
  }
}
