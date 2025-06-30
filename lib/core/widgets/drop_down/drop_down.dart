import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/resources/validation.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onservice24/core/widgets/text-field/custom_text_field.dart';

class DropDownField extends StatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? inatialValue;
  final String? hint;
  final String? value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(DropDownItem?)? onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final double? radius;
  final Color? borderColor;
  final double? width;
  final Offset? offset;
  final double? fontSize;
  final EdgeInsetsGeometry? contentPadding;

  const DropDownField(
      {Key? key,
      required this.items,
      this.inatialValue,
      this.title,
      this.hint,
      this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.value,
      this.iconWidget,
      this.isValidator = true,
      this.validator,
      this.style,
      this.radius,
      this.borderColor,
      this.width,
      this.offset,
      this.fontSize,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = this.radius ?? 12;
    Color borderColor = this.borderColor ?? context.dividerColor;
    TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null) ...[
          20.ph,
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
        DropdownButtonFormField2<DropDownItem>(
          isExpanded: true,
          value: value != null
              ? items.firstWhereOrNull((element) => element.id == value)
              : null,
          // alignment: Alignment.topCenter,
          decoration: InputDecoration(
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            // label: Text(
            //   hint ?? '',
            //   style: context.displaySmall,
            // ),
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.primaryColor,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            // Add more decoration..
          ),
          hint: Text(
            hint ?? '',
            style: context.displaySmall,
          ),
          items: items
              .map((item) => DropdownMenuItem<DropDownItem>(
                    value: item,
                    child: Text(
                      item.title ?? '',
                      style: context.bodyMedium.copyWith(fontSize: fontSize),
                      // textAlign: TextAlign.center,
                    ),
                  ))
              .toList(),
          validator: isValidator
              ? (value) => Validation.validateRequired(value?.title ?? '')
              : null,
          onChanged: onChanged,
          onSaved: (value) {
            //  selectedValue = value.toString();
          },
          buttonStyleData: ButtonStyleData(
            padding: 5.paddingEnd,
            // height: 30,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: kDropDown,
            ),
            iconSize: 25,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            maxHeight: 300,
            width: width,
            offset: offset ?? const Offset(0, 0),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          dropdownSearchData: DropdownSearchData(
            searchInnerWidgetHeight: 50,
            searchController: controller,
            searchInnerWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                hintText: context.strings.search_here,
                controller: controller,
                prefixIcon: Icon(Icons.search),
              ),
            ),
            searchMatchFn: (DropdownMenuItem<DropDownItem> item, String text) {
              return item.value?.title
                      ?.toLowerCase()
                      .contains(text.toLowerCase()) ??
                  false;
            },
          ),
        ),
      ],
    );
  }
}

class DropDownItem {
  final String? id;
  final String? title;
  final String? value;
  final IconData? icon;
  final Widget? child;

  const DropDownItem({this.id, this.title, this.value, this.icon, this.child});
}
