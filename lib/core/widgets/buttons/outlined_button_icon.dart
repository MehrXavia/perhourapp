import 'package:onservice24/src/main_index.dart';



class SecondaryButtonIcon extends StatelessWidget {
  final String? title;
  final String icon;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const SecondaryButtonIcon({Key? key, this.title, required this.icon, this.onPressed, this.height, this.radius, this.borderColor, this.textColor, this.backgroundColor, this.child, this.padding, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 10))
        ),
        backgroundColor: backgroundColor,
        fixedSize: Size(width ?? context.w, height ?? 45),
        side: BorderSide(color: borderColor ?? context.primaryColor),
        padding: padding ?? 0.paddingAll,
      ),
      icon: AppIcon(icon: icon, size: 20,),
      label:child ?? FittedBox(child: Text(title ?? '', style: context.headlineSmall.copyWith(color: textColor, fontSize: 16),)),
    );

  }
}
