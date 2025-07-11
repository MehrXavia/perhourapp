import 'package:onservice24/core/widgets/buttons/primary_icon_button.dart';
import 'package:onservice24/src/main_index.dart';
import 'package:flutter/material.dart';

class RowTextsIconsButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final EdgeInsetsGeometry? margin;
  final String icon1;
  final String icon2;
  final Color? iconColor1;
  final Color? backgroundColor1;
  final Color? iconColor2;
  final Color? backgroundColor2;
  final double? iconSize1;
  final double? iconSize2;
  final BorderRadiusGeometry? borderRadius1;
  final BorderRadiusGeometry? borderRadius2;
  const RowTextsIconsButtons({Key? key, this.title1, this.title2, this.onPressed1, this.onPressed2, this.margin, required this.icon1, required this.icon2, this.iconColor1, this.backgroundColor1, this.iconColor2, this.backgroundColor2, this.iconSize1, this.iconSize2, this.borderRadius1, this.borderRadius2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: PrimaryIconButton(
              title: title1,
              icon: icon1,
              backgroundColor: backgroundColor1 ?? context.outline,
              borderRadius: borderRadius1,
              radius: 10,
              onPressed: onPressed1,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: PrimaryIconButton(
              title: title2,
              icon: icon2,
              iconColor: iconColor2 ?? context.cardColor,
              titleStyle: context.labelMedium.copyWith(),
              backgroundColor: backgroundColor2 ?? theme.primaryColor,
              borderRadius: borderRadius2,
              radius: 10,
              onPressed: onPressed2,
            ),
          ),
        ],
      ),
    );
  }
}
