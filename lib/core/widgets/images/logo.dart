import 'package:onservice24/core/assets/app_images.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 9/3/2023.
class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  final double? size;

  const Logo({super.key, this.width, this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: size ?? width ,
      height: size ?? height ,
    );
  }
}
