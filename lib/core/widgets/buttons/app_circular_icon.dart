
import '../../../src/main_index.dart';

class AppCircularIcon extends StatelessWidget {
  final String? icon;
  final IconData? iconData;
  final double? size;
  final Color? background;
  final double? radius;
  final Color? color;
  const AppCircularIcon({Key? key, this.icon, this.size, this.background, this.radius, this.color, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CircleAvatar(
      radius: radius ?? 20,
      backgroundColor: background,
      child: iconData != null ? Icon(
        iconData!,
        color: color,
        size: size ?? 20,
      ) : AppIcon(
        icon: icon!,
        color: color,
        size: size ?? 20,
      ),
    );
  }
}
