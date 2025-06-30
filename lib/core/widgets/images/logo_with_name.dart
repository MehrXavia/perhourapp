import 'package:onservice24/core/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';

import '../../assets/app_icons.dart';
import '../buttons/app_icon.dart';

///  Created by harbey on 9/3/2023.
class LogoWithName extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;
  final double? sizeLogoMame;

  const LogoWithName({super.key, this.width, this.height, this.size, this.sizeLogoMame});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.logo,
          width: size ?? width ?? 100,
          height: size ?? height ?? 100,
        ),
        14.ph,
        AppIcon(icon: AppIcons.logo_name, size: sizeLogoMame ?? 28),
      ],
    );
  }
}
