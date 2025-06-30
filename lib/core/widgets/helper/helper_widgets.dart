import 'package:onservice24/src/main_index.dart';

import '../animations/slide_animation.dart';
import '../text-field/material_text_field.dart';

Widget buildSearchWidget(
    {required Function(String text) onChange,
    required String hint,
    TextEditingController? controller}) {
  return MaterialTextField(
    style: kTextRegular.copyWith(fontSize: 13),
    controller: controller,
    onChanged: onChange,
    inputDecoration: kTextFieldDecoration.copyWith(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
          child: SvgPicture.asset(
            'images/ic_search.svg',
            width: 15,
            height: 15,
          ),
        ),
        hintText: hint,
        contentPadding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 15,
        ),
        hintStyle: kTextRegular.copyWith(fontSize: 10, color: kGreyColor)),
  );
}

Future showAppModalBottomSheet({
  required BuildContext context,
  bool? isScrollControlled = true,
  required Widget child,
  String? title,
  double? topMargin,
  Widget? sized,
  Widget? titleWidget,
  EdgeInsetsGeometry? padding,
  double? radius,
  Color? backgroundColor,
  bool? isDivider = true,
  bool? useRootNavigator ,
}) {
  ThemeData theme = Theme.of(context);
  return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled == true,
      isDismissible: true,
      enableDrag: true,
      useRootNavigator: useRootNavigator??true,
      constraints: isScrollControlled == true
          ? null
          : const BoxConstraints(maxHeight: 500),
      backgroundColor: Colors.transparent,
      builder: (BuildContext builder) {
        return SlideAnimationWidget(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: backgroundColor ?? theme.cardColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius ?? 20.0),
                      topRight: Radius.circular(radius ?? 20.0))),
              margin: isScrollControlled == true
                  ? EdgeInsets.only(top: topMargin ?? 100)
                  : EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  if (title != null)
                    Row(
                      children: [
                        const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 10,
                            )),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Text(
                                title,
                                style: theme.textTheme.headlineLarge
                                    ?.copyWith(color: kPrimaryDark),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: 50.paddingHoriz,
                                child: const Divider(
                                  color: kPrimaryDark,
                                  thickness: .5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: sized?? const CircleAvatar(
                            radius: 18,
                            backgroundColor: kBlueColorE4,
                            child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.close,
                                  color: kBlueColorE4,
                                )),
                          ),
                        ))
                      ],
                    ),

                    Container(
                      color: backgroundColor ?? theme.cardColor,
                      padding: padding ??
                          const EdgeInsetsDirectional.only(
                              start: 16, end: 16, top: 20, bottom: 0),
                      child: child,
                    ),
                ],
              )),
        );
      });
}

showAppDialog({
  required BuildContext context,
  required Widget child,
  String? title,
  double? topMargin,
  EdgeInsetsGeometry? padding,
  double? radius,
  Color? backgroundColor,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          backgroundColor: backgroundColor ?? Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 20)),
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          content: child,
        );
      });
}
