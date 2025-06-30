
import '../../../src/main_index.dart';

class MaterialTextTile extends BaseStatelessWidget {
  final String icon;
  final String title;
  final bool isLast;
  final Widget? trailing;
  final double? size;
  final VoidCallback? onTap;

  MaterialTextTile(
      {Key? key,
        required this.icon,
        required this.title,
        this.isLast = false,
        this.trailing,
        this.size,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            color: theme.cardColor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                AppIcon(icon: icon, size: size ?? 20),
                const SizedBox(width: 20),
                Text(title, style: theme.textTheme.bodyMedium!),
                const Spacer(),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          if (!isLast)
            Row(
              children: [
                Material(
                  color: theme.dividerColor,
                  child: const SizedBox(
                    width: 50,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
              ],
            ),
        ],
      ),
    );
  }
}