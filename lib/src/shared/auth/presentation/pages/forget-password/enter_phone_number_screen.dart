import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';

import '../../../../../../core/assets/app_icons.dart';
import '../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../core/widgets/buttons/primary_button.dart';
import '../../../../../../core/widgets/text-field/custom_text_field.dart';

class EnterPhoneNumberScreen extends BaseStatelessWidget {
  final Function(String) onEnterPhoneNumber;

  EnterPhoneNumberScreen({Key? key, required this.onEnterPhoneNumber}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: (kToolbarHeight + 20).paddingTop + 16.paddingAll,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   strings.please_enter_your_phone_number_message,
            //   textAlign: TextAlign.center,
            //   style: theme.textTheme.headlineLarge,
            // ),
            CustomTextField(
              controller: phoneNumberController,
              hintText: strings.phone_number,
              iconPath: AppIcons.phoneOutline,
              keyboardType: TextInputType.phone,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            const Spacer(),
            PrimaryButton(
              title: strings.confirm,
              radius: 8,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onEnterPhoneNumber(phoneNumberController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
