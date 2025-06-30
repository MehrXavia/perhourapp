import 'package:flutter/material.dart';

import '../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../core/decorations/decorations.dart';
import '../../../../../../core/themes/colors.dart';
import '../../../../../../core/themes/text_styles.dart';

class SaveButton extends BaseStatelessWidget {
   SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: 60,
        width: 180,
        decoration: Decorations.kDecorationBorderRadius(radius: 12,color:kMainColor ),
        child: Center(
            child: Text(
              strings.save,
              style: kTextBold.copyWith(color: kPrimaryLight, fontSize: 18),
            )),
      ),
    );
  }
}
