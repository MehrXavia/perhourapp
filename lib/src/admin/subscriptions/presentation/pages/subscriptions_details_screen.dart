 import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/core/widgets/buttons/custom_button.dart';
import 'package:onservice24/core/widgets/custom_toast_app.dart';
import 'package:onservice24/src/admin/payment_subscribtion/pages/payment_page.dart';
import 'package:onservice24/src/main_index.dart';

import '../widgets/common_text.dart';
import '../widgets/payment_body.dart';
import '../../data/models/AllSubscriptionDto.dart';

class SubscriptionsDetailsScreen extends BaseStatelessWidget {
  SubscriptionsDetailsScreen({super.key, required this.allSubscriptionDto});
  AllSubscriptionDto allSubscriptionDto;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: strings.subscription_invoice,
      titleStyle: kTextSemiBold.copyWith(fontSize: 17, color: Colors.black),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              70.ph,
              PaymentBody(allSubscriptionDto: allSubscriptionDto),
              60.ph,

              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          activeColor: kMainColor,
                          value: isChecked,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          //activeColor: context.primaryColor,
                          side: BorderSide(
                            color: context.dividerColor,
                            width: 1,
                          ),
                          visualDensity: VisualDensity.compact,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      InkWell(
                        onTap: () {
                          showAppModalBottomSheet(
                              context: context,
                              isScrollControlled: false,

                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                      Text(
                                      "أنه لم يسبق أن تم تعطيل استخدامك لخدمات التطبيق  أو منعك من استخدامها في أي وقت من الأوقات.أنك لست منافساً لالتطبيق ، كما أنك لا تقدم أي منتج منافس للخدمات المقدمة من التطبيق .أنك تتمتع بكامل القوة والسلطة للتعاقد وأنك بذلك لن تكون منتهكاً لأي قانون أو عقد، وأنه لا يوجد عليك أي سوابق قضائية أو أوامر قبض أو مطالبات لدى الجهات الأمنية.",
                                      style: kTextRegular.copyWith(fontWeight: FontWeight.w400,fontSize: 15),
                                    ),
                                    30.ph,
                                    customButton(
                                        buttonText: strings.ok,
                                        buttonColor: kBlueColorE4,
                                        buttonTextColor: Colors.white,
                                        buttonFunc: () {
                                          isChecked=true;
                                          setState(() {
                                            isChecked = true;
                                           pop();
                                          });
                                        }),
                                  ],
                                ),
                              ));
                        },
                        child: RichText(
                            text: TextSpan(
                                style: kTextSemiBold.copyWith(
                                    color: kBlackColor_12, fontSize: 15),
                                children: [
                              TextSpan(
                                  text: strings.i_have_read_and_agree,
                                  style: kTextSemiBold.copyWith(
                                      color: kBlackColor_12, fontSize: 14)),
                              TextSpan(
                                  text: strings.terms_and_conditions,
                                  style: kTextSemiBold.copyWith(
                                      color: kMainColor, fontSize: 14)),
                            ])),
                      )
                    ],
                  );
                }
              ),
              60.ph,
              CommonText(allSubscriptionDto:allSubscriptionDto),
              60.ph,
              PrimaryButton(
                title: strings.paying_off,
                margin: 10.paddingAll,
                onPressed: () {
                  if (isChecked == false) {
                    showToast(
                        message: strings.check_please,
                        state: ToastStates.WARNING);
                  } else {
                    push(context, PaymentPage(allSubscriptionDto: allSubscriptionDto,));
                  }

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
