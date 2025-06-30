import 'package:flutter/material.dart';

class CustomRadioListTile2 extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;
  const CustomRadioListTile2(
      {Key? key,
      required this.title,
      required this.groupValue,
      required this.onChanged, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          activeColor: theme.colorScheme.secondary,
          value: value,
          groupValue: groupValue,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          onChanged: onChanged,
        ),
        Expanded(child: Text(title, style: theme.textTheme.bodyMedium)),
      ],
    );
  }
}
