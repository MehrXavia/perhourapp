 import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:onservice24/core/widgets/buttons/row_buttons.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/images/logo_with_name.dart';

class CreateNewAccountScreen extends BaseStatelessWidget {
  CreateNewAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? argument = getArguments<int>(context)??0;
    return AppScaffold(
      title:argument == 1?strings.login: strings.create_new_account,
      backgroundColor: Colors.white,
      isHome: true,
      body: Padding(
        padding: 16.paddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoWithName(),
            40.ph,
            RowButtons(
              title1: strings.service_provider,
              title2: context.strings.user,
              onPressed1: () {
                if (argument == 1) {
                  pushNamed(Routes.login,arguments: 2);
                } else {
                  pushNamed(Routes.createServiceProviderAccountPage);
                }
              },
              onPressed2: () {
                if (argument == 1) {
                  pushNamed(Routes.login,arguments: 1);
                } else {
                  pushNamed(Routes.createUserAccountPage);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  onFinish() {

    Navigators.pushNamedAndRemoveUntil(Routes.login);
    // Navigator.
  }

  Widget skipTextButton(BuildContext context) {
    return Text(
      context.strings.profile,
      style: context.labelMedium,
    );
  }

  Icon skipIcon(BuildContext context) {
    return const Icon(
      Icons.arrow_forward_rounded,
      color: Colors.white,
      weight: 20,
    );
  }

  finishButtonStyle(BuildContext context) {
    return FinishButtonStyle(
        backgroundColor: context.colorScheme.surface,
        foregroundColor: Colors.white,
        splashColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(500))));
  }
}
