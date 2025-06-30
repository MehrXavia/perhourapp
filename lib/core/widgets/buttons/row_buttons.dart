import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:onservice24/core/widgets/buttons/primary_button.dart';

class RowButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final EdgeInsetsGeometry? margin;
  const RowButtons({Key? key, this.title1, this.title2, this.onPressed1, this.onPressed2, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              title: title1,
              // borderRadius: const BorderRadius.only(
              //   topRight: Radius.circular(25),
              //   bottomRight: Radius.circular(25),
              // ),
              fontSize: 14,
              onPressed: onPressed1,
            ),
          ),
          12.pw,
          Expanded(
            child: PrimaryButton(
              title: title2,
              backgroundColor: context.colorScheme.onSecondary,
              color: context.bodySmall.color,
              // borderRadius: const BorderRadius.only(
              //   topLeft: Radius.circular(25),
              //   bottomLeft: Radius.circular(25),
              // ),
              fontSize: 14,
              onPressed: onPressed2,
            ),
          ),
        ],
      ),
    );
  }
}
