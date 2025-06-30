import '../../../src/main_index.dart';

class BottomNavigatorBarItem extends StatelessWidget {
  final String icon;
  final String? label;
  final Color? color;
  final VoidCallback onTap;

  BottomNavigatorBarItem({
    Key? key,
    required this.icon,
    this.label,
    this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: AppIcon(
                      icon: icon,
                      color: color ?? Theme.of(context).primaryColor,
                      padding: 0.paddingAll,
                    ),
                  ),
                  Text(
                    label!,
                    style: context.titleLarge.copyWith(
                      color: color ?? Theme.of(context).primaryColor,
                      fontSize: 14,
                    )
                  ),
                ],
              ),
      ),
    );
  }
}
