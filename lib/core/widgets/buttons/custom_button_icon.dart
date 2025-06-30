import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/themes/light_theme.dart';

import '../../decorations/decorations.dart';
import 'app_icon.dart';

class CustomButtonIcon extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String? icon;
  final Color? iconColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  const CustomButtonIcon(
      {Key? key,
        this.title,
        this.onPressed,
        this.height,
        this.backgroundColor,
        this.borderRadius,
        this.icon,
        this.iconColor,
        this.titleStyle,
        this.decoration,
        this.padding,
        this.radius,
        this.margin,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
       // height: 55,
        width: 300,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        margin: const EdgeInsets.only(left: 42,right: 42,top: 12),                     //margin ?? EdgeInsets.zero,
        decoration: decoration ?? Decorations.kDecorationOnlyRadius(color: backgroundColor ?? whiteColor, radius: radius ?? 12,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(icon: icon ??"", color: iconColor ?? theme.primaryColor, size: 25,padding: 10.paddingHoriz),
            // AppIcon(icon: icon, color: iconColor ?? theme.primaryColor, size: 20,padding:25.paddingHoriz),
           // 14.pw,
            Text(title!,
              style: titleStyle ?? theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}
