import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';

class DropDownFieldGender extends BaseStatelessWidget {
  final void Function(String)? onChanged;
  String?  value;
  DropDownFieldGender({super.key, this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    List<DropDownItem>  data=  [
      DropDownItem(
        id: 'male',
        title: strings.male,
      ),
      DropDownItem(
        id: 'female',
        title: strings.female,
      ),
    ];
    return DropDownField(
      hint: strings.gender,
      items: data,
      onChanged: (item) {
        onChanged?.call(item?.id ?? '');
      },
      value: value,

    );
  }


}
