import 'package:flutter/material.dart';

import '../../decorations/decorations.dart';
import 'app_icon.dart';

class PrimaryIconButtonSpaceBetween extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String icon;
  final Color? iconColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  const PrimaryIconButtonSpaceBetween(
      {Key? key,
      this.title,
      this.onPressed,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      required this.icon,
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
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        margin: margin ?? EdgeInsets.zero,
        decoration: decoration ?? Decorations.kDecorationOnlyRadius(color: backgroundColor ?? theme.primaryColor, radius: radius ?? 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title!,
              style: titleStyle ?? theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            AppIcon(icon: icon, color: iconColor ?? theme.primaryColor, size: 30),
          ],
        ),
      ),
    );
  }
}
