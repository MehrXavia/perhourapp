import 'package:onservice24/src/main_index.dart';

class CustomTextField extends StatelessWidget {
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
  final String? suffixText;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final double? suffixTextSize;
  final bool? isValidator;
  final bool? readOnly;

  CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixText,
    this.suffixTextSize,
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
    this.suffixIcon,
    this.radius,
    this.iconPath,
    this.isValidator = true,
    this.readOnly = false,
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
              onTap: onTap,
              controller: controller,
              readOnly: onTap != null || readOnly == true,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: context.bodyMedium,
              expands: false,
              minLines: maxLines,
              cursorColor: context.primaryColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // textInputAction: TextInputAction.next,
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
                    prefixIcon: iconPath != null
                        ? AppIcon(
                            padding: const EdgeInsets.all(12),
                            icon: iconPath!,
                            size: 20,
                          )
                        : prefixIcon,

                    suffixIcon: suffixText == null
                        ? suffixIcon
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10,
                                height: 50,
                                child: VerticalDivider(
                                  color: context.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: 3.paddingHoriz,
                                child: Text(
                                  suffixText ?? '',
                                  textAlign: TextAlign.center,
                                  style: context.displaySmall.copyWith(
                                      color: const Color(0xff121212),
                                      fontSize: suffixTextSize??11),
                                ),
                              ),
                            ],
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

class CustomTextFieldWithoutBorder extends StatelessWidget {
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
  final String? suffixText;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? isValidator;
  final bool? readOnly;

  CustomTextFieldWithoutBorder({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixText,
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
    this.suffixIcon,
    this.radius,
    this.iconPath,
    this.isValidator = true,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? 4.paddingAll,
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
            height: 40,
            child: TextFormField(
              onTap: onTap,
              controller: controller,
              readOnly: onTap != null || readOnly == true,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: context.bodyMedium,
              expands: false,
              minLines: maxLines,

              cursorColor: context.primaryColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // textInputAction: TextInputAction.next,
              decoration: inputDecoration ??
                  InputDecoration(
                    hintText: hintText,
                    counterStyle: theme.textTheme.displaySmall
                        ?.copyWith(color: Colors.black),
                    hintStyle: hintStyle ?? theme.textTheme.displaySmall,
                    fillColor: fillColor ?? theme.colorScheme.background,
                    filled: true,
                    errorStyle: theme.textTheme.displaySmall!
                        .copyWith(color: context.errorColor, fontSize: 10),
                    prefixIcon: iconPath != null
                        ? AppIcon(
                            padding: const EdgeInsets.all(12),
                            icon: iconPath!,
                            size: 20,
                          )
                        : prefixIcon,
                    suffixIcon: suffixText == null
                        ? suffixIcon
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10,
                                height: 50,
                                child: VerticalDivider(
                                  color: context.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: 3.paddingHoriz,
                                child: Text(
                                  suffixText ?? '',
                                  textAlign: TextAlign.center,
                                  style: context.displaySmall.copyWith(
                                      color: const Color(0xff121212),
                                      fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                    contentPadding: contentPadding ??
                        const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),

              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField2 extends BaseStatelessWidget {
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
  final String? prefixIcon;
  final String? iconPath;
  final String? suffixText;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? isValidator;
  final bool? readOnly;

  CustomTextField2({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixText,
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
    this.suffixIcon,
    this.radius,
    this.iconPath,
    this.isValidator = true,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorBorderSide = this.colorBorderSide ?? context.dividerColor;
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? 10.paddingBottom,
      //  height: 40,
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
              onTap: onTap,
              controller: controller,
              readOnly: onTap != null || readOnly == true,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines,
              keyboardType: keyboardType,
              style: theme.textTheme.headlineMedium?.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              expands: false,
              minLines: maxLines,
              validator: (validator == null)
                  ? (value) {
                      String pattern =
                          r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                      RegExp regExp = RegExp(pattern);
                      if (value == null ||
                          value.characters.length == 0 ||
                          value.isEmpty) {
                        return null;
                      } else {
                        if (!regExp.hasMatch(value)) {
                          return strings.valid_url;
                        }
                        return null;
                      }
                    }
                  : validator,
              cursorColor: context.primaryColor,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // textInputAction: TextInputAction.next,
              decoration: inputDecoration ??
                  InputDecoration(
                    hintText: hintText,
                    hintStyle: hintStyle ?? theme.textTheme.displaySmall,
                    fillColor: fillColor ?? theme.colorScheme.background,
                    filled: true,
                    errorStyle: theme.textTheme.displaySmall!
                        .copyWith(color: context.errorColor, fontSize: 10),
                    prefixIcon: prefixIcon == null
                        ? null
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              10.pw,
                              AppIcon(
                                icon: prefixIcon ?? '',
                                size: 20,
                              ),
                              10.pw,
                              SizedBox(
                                width: 10,
                                height: 50,
                                child: VerticalDivider(
                                  color: context.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                            ],
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

              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
