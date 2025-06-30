 import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
 import 'package:onservice24/src/main_index.dart';
 import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/images/logo_with_name.dart';
import '../../../../navigation_pages_v2.dart';
import '../widgets/languages_selection.dart';

class OnBoardingScreen extends BaseStatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: 16.paddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kToolbarHeight.ph,
            const LogoWithName(),
            20.ph,
            Text(
              strings.on_boarding_desc,
              style: bodySmall.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            20.ph,
            PrimaryButton(
              margin: 20.paddingTop,
              title: strings.create_account_now,
              onPressed: () {
                pushNamed(Routes.createNewAccountScreen,arguments: 0);
              },
            ),
            // MediaQuery.of(context).size.height > 600
            //     ? 20.ph
            //     : 10.ph,
            PrimaryButton(
              title: context.strings.login_as_guest,
              margin: 20.paddingVert,
              color: bodySmall.color,
              backgroundColor: theme.colorScheme.onSecondary,
              onPressed: () {
                push(context, NavigationPagesV2());
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(strings.already_have_an_account,
                    style: titleLarge.copyWith(
                        fontSize: 14, color: bodyLarge.color)),
                5.pw,
                GestureDetector(
                  onTap: () {
                    pushNamed(Routes.createNewAccountScreen,arguments: 1);

                  },
                  child: Text(
                    strings.make_login,
                    style: titleLarge.copyWith(
                        fontSize: 14, color: headlineLarge.color),
                  ),
                ),
              ],
            ),
            20.ph,
            LanguagesSelection(),
            20.ph,
          ],
        ),
      ),
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
