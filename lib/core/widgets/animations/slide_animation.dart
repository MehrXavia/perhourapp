import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';

class SlideAnimationWidget extends StatelessWidget{
  final Widget child;

  const SlideAnimationWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return  FadedSlideAnimation(child: child,
      beginOffset: const Offset(0,1),
      endOffset: const Offset(0, 0),
      fadeDuration: const Duration(milliseconds: 500),
      slideDuration: const Duration(milliseconds: 500),
      slideCurve: Curves.linearToEaseOut,);
  }

}