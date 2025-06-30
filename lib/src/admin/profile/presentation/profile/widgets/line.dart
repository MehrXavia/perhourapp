import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';

import '../../../../../../core/themes/colors.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: 20.paddingHoriz,
      height: 2,
      color:kDropDown ,
    );
  }
}
