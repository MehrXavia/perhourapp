import 'package:onservice24/core/resources/validation.dart';
import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';
import '../pin_code/pin_code_fields.dart';

class CustomPinCode extends BaseStatelessWidget {
  final bool isRequired;
  final TextEditingController pinCodeController;
   CustomPinCode({Key? key, this.isRequired = true, required this.pinCodeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: pinCodeController,
      appContext: context,
      length: 6,
      onChanged: (value) {},
      showCursor: true,
      keyboardType: TextInputType.number,
      autoFocus: true,
      enableActiveFill: true,
      backgroundColor: Colors.transparent,
      validator: isRequired ? (value) => Validation.validateRequired(value!) : null,
      pinTheme: PinTheme(
        activeFillColor: theme.cardColor,
        inactiveFillColor: theme.cardColor,
        selectedFillColor: theme.cardColor,
        fieldHeight: 40,
        fieldWidth: 40,
        activeBorderWidth: 0,
        inactiveBorderWidth: 0,
        selectedBorderWidth: 1.5,
        borderRadius: BorderRadius.circular(8),
        shape: PinCodeFieldShape.box,
        activeColor: Colors.transparent,
        selectedColor: theme.primaryColor,
        inactiveColor: theme.dividerColor,
        disabledColor: theme.dividerColor,
      ),
    );
  }
}
