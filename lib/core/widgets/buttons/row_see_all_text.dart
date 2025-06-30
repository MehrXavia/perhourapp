import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/navigator.dart';

///  Created by harbey on 9/5/2023.
class RowSeeAllText extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final String routeName;

  const RowSeeAllText({
    super.key,
    required this.title,
    this.onTap,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (10.paddingBottom + 16.paddingTop + 16.paddingHoriz),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.bodyLarge.copyWith(fontSize: 16),
          ),
          GestureDetector(
            onTap: onTap ?? () {
              Navigators.pushNamed(routeName);
            },
            child: Text(
              context.strings.sea_all,
              style: context.bodyLarge.copyWith(
                fontSize: 14,
                color: context.colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
