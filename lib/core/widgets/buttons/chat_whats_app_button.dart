import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/core/widgets/buttons/app_icon_button.dart';

import '../../assets/app_icons.dart';
import '../../components/base_stateless_widget.dart';

class WhatsAppButton extends BaseStatelessWidget {
  final String phone;

  WhatsAppButton({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      icon: AppIcons.whatsapp,
      size: 30,
      padding: 0,
      margin: 10.paddingEnd,
      backgroundColor: Colors.white,
      onPressed: () {
        HelperMethods.launchWhatsApp(phone);
      },
    );
  }
}
