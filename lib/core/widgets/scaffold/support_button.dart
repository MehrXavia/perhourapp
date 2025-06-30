
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assets/app_icons.dart';
import '../../components/base_stateless_widget.dart';
import '../../utils/helper_methods.dart';
import '../buttons/primary_icon_button_space.dart';

class SupportButton extends BaseStatelessWidget {
  final String phone;
  SupportButton({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryIconButtonSpaceBetween(
      title: strings.contact_support,
      titleStyle: context.labelLarge!.copyWith(
        color:  Colors.green.shade900,
        fontSize: 16,
      ),
      icon: AppIcons.callAnswer,
      iconColor: Colors.green.shade900,
      backgroundColor: Colors.green.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),

      onPressed: () => HelperMethods.launchCallPhone(phone),
    );
  }
}
