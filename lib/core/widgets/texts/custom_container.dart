import 'package:flutter/material.dart';

import '../../../src/main_index.dart';
import 'column_texts.dart';

class CustomContainer extends StatelessWidget {
  final String? title;
  final String? value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Widget? footer;
  const CustomContainer({Key? key,  this.title,  this.value, this.titleStyle, this.valueStyle, this.padding, this.child, this.footer, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      margin: margin ??  0.paddingVert,
      decoration: Decorations.kDecorationOnlyRadius(color: Theme.of(context).cardColor),
  //    height: 70,
      child: child ??
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: titleStyle ?? context.displayMedium.copyWith(fontSize: 14),
              maxLines: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    value!,
                    style: valueStyle ?? context.bodyMedium,
                  ),
                ), footer ?? const SizedBox.shrink(),
              ],
            ),

          ],
         )
    );
  }
}
