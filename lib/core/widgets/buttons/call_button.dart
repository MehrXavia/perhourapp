import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:onservice24/core/widgets/buttons/app_icon_button.dart';

import '../../assets/app_icons.dart';
import '../../utils/helper_methods.dart';

class CallButton extends StatelessWidget {
  final String phone;
  final double? size;
  const CallButton({Key? key, required this.phone, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      icon: AppIcons.phone,
      color: context.cardColor,
      padding: 8,
      size: size ?? 14,
      backgroundColor: Colors.green,
      onPressed: () {
        HelperMethods.launchCallPhone(phone);
      },
    );
  }
}
