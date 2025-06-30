import 'package:onservice24/src/main_index.dart';

class TextFieldSuffix extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool? isPassword;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final String? iconPath;
  final String? suffixInText;
  final String? suffixOutText;
  final String? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? isValidator;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixWidget;

  const TextFieldSuffix({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixInText,
    this.suffixOutText,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.isPassword,
    this.onTap,
    this.onChanged,
    this.validator,
    this.inputDecoration,
    this.keyboardType,
    this.fillColor,
    this.hintStyle,
    this.textAlign,
    this.prefixIcon,
    this.maxLines,
    this.colorBorderSide,
    this.padding,
    this.contentPadding,
    this.radius,
    this.iconPath,
    this.isValidator = true,
    this.readOnly = false,
    this.inputFormatters,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorBorderSide = this.colorBorderSide ?? context.dividerColor;
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? 10.paddingBottom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            20.ph,
            Text(
              labelText ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            5.ph,
          ],
          SizedBox(
            // height: 60,
            child: TextFormField(
              // onTap: onTap,
              controller: controller,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: context.bodyMedium,
              expands: false,
              minLines: maxLines,
              cursorColor: context.primaryColor,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // textInputAction: TextInputAction.next,
              inputFormatters: inputFormatters,
              decoration: inputDecoration ??
                  InputDecoration(
                    // label: Text(
                    //   'hint' ?? '',
                    //   style: context.displaySmall,
                    // ),
                    //        labelText: labelText ?? '',

                    //         label: Text(labelText ?? '', style: theme.textTheme.headlineMedium!.copyWith()),
                    hintText: hintText,

                    hintStyle: hintStyle ?? theme.textTheme.displaySmall,
                    fillColor: fillColor ?? theme.colorScheme.background,
                    filled: true,
                    errorStyle: theme.textTheme.displaySmall!
                        .copyWith(color: context.errorColor, fontSize: 10),
                    // prefixIcon: iconPath != null
                    //     ? AppIcon(
                    //         padding: const EdgeInsets.all(12),
                    //         icon: iconPath!,
                    //         size: 20,
                    //       )
                    //     : prefixIcon,
                    //    suffixIcon: suffixIcon,

                    suffixIcon: suffixWidget ?? GestureDetector(
                      onTap: onTap,
                      child: Padding(
                        padding: 10.paddingHoriz,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (suffixOutText != null)
                              Text(
                                suffixOutText ?? '',
                                style: context.displaySmall,
                              ),
                            SizedBox(
                              width: 10,
                              height: 50,
                              child: VerticalDivider(
                                color: context.dividerColor,
                                thickness: 1,
                              ),
                            ),
                            5.pw,
                            Text(
                              suffixInText ?? '',
                              style: context.bodyLarge,
                            ),
                            if (suffixIcon != null)
                              AppIcon(
                                padding: 8.paddingStart,
                                  icon: suffixIcon!,
                                  size: suffixIconSize ?? 6,
                                  color: suffixIconColor),
                          ],
                        ),
                      ),
                    ),
                    contentPadding: contentPadding ??
                        const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 12)),
                      borderSide:
                          BorderSide(color: colorBorderSide ?? context.outline),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 12)),
                      borderSide:
                          BorderSide(color: colorBorderSide ?? context.outline),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(radius ?? 12)),
                      borderSide:
                          BorderSide(color: colorBorderSide ?? context.outline),
                    ),
                  ),
              validator: (isValidator! && validator == null)
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return context.strings.this_field_is_required;
                      }
                      return null;
                    }
                  : validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
