import 'package:flutter/material.dart';

import '../../../../../../core/themes/colors.dart';
import '../../../../../../core/themes/text_styles.dart';

class TextUtils extends StatelessWidget {
  TextUtils({super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      style: kTextRegular.copyWith(
        fontSize: fontSize,
        color: kBlackColor_12,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
