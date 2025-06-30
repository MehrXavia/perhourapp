import 'package:onservice24/src/main_index.dart';

class Decorations {
  static BoxDecoration kDecorationOnlyRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
    );
  }

  static BoxDecoration kDecorationTopRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius ?? 12),
        topRight: Radius.circular(radius ?? 12),
      ),
    );
  }

  static BoxDecoration kDecorationLiftRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(radius ?? 15),
        bottomStart: Radius.circular(radius ?? 15),
      ),
    );
  }

  static BoxDecoration kDecorationBottomRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius ?? 25),
        bottomRight: Radius.circular(radius ?? 25),
      ),
    );
  }

  static BoxDecoration kDecorationBorderRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
      border: Border.all(
        color: borderColor ?? kBorderColor,
        width: borderWidth ?? 1.0,
      ),
    );
  }

  static BoxDecoration kDecorationRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
      border: Border.all(color: borderColor??kGreyColor)
    );
  }

  static BoxDecoration boxShape({
    required Color color,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }

  static ShapeDecoration shapeDecorationShadow(
      {Color? color,
      required Color colorShadow,
      double? radius,
      BorderRadiusGeometry? borderRadius}) {
    return ShapeDecoration(
      color: color ?? injector<ServicesLocator>().appContext.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 5)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.5),
          blurRadius: 10,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }


  static ShapeDecoration shapeTopDecorationShadow(
      {Color? color,
        required Color colorShadow,
        double? radius,
        BorderRadiusGeometry? borderRadius}) {
    return ShapeDecoration(
      color: color ?? injector<ServicesLocator>().appContext.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.only(
            topLeft: Radius.circular(radius ?? 12),
            topRight: Radius.circular(radius ?? 12),
          )),
      shadows: [
        BoxShadow(
          color: colorShadow,
          blurRadius: 10,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static ShapeDecoration shapeBottomShadow(
      {required Color color, required Color colorShadow, double? radius}) {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.05),
          blurStyle: BlurStyle.solid,
          offset: Offset(100, 100),
        )
      ],
    );
  }

  static ShapeDecoration shapeTopShadow(
      { Color? color, Color? colorShadow, double? radius}) {
    BuildContext context = injector<ServicesLocator>().appContext;
    return ShapeDecoration(
      color: color ?? context.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: context.primaryColorDark.withOpacity(0.15),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration decorationBorderShadow(
      {Color? color,
      required Color borderColor,
      required Color colorShadow,
      double? radius}) {
    return BoxDecoration(
      color:   color?? const Color(0xffCDD4D933),
      borderRadius: BorderRadius.circular(radius ?? 12),
      border: Border.all(
        color: borderColor,
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: colorShadow.withOpacity(0.5),
          blurRadius: 3,
          offset: const Offset(1,1),
          spreadRadius: 2,
        )
      ],
    );
  }

  static BoxDecoration baseDecoration(
      {Color? color, Color? borderColor, Color? colorShadow, double? radius}) {
    final context = injector<ServicesLocator>().appContext;
    return BoxDecoration(
      color: color ?? context.cardColor,
      borderRadius: BorderRadius.circular(radius ?? 12),
      border: Border.all(
        color: borderColor ?? context.dividerColor,
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: colorShadow ?? context.primaryColorDark.withOpacity(0.15),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration baseDecoration2(
      {Color? color, Color? borderColor, Color? colorShadow, double? radius}) {
    final context = injector<ServicesLocator>().appContext;
    return BoxDecoration(
      color: color ?? context.cardColor,
      borderRadius: BorderRadius.circular(0),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.149),
          blurRadius: 30,
          spreadRadius: 0,
        offset: const Offset(0, -6)
        )
      ],
    );
  }

  static Decoration get decorationTabs => decorationTabsOnlyTop(borderRadius: BorderRadius.circular(10));

  static Decoration decorationTabBarView({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 15),
      color: kPrimaryLight,
        border: Border.all(color: kBlueColorE4)
    );
  }
  static Decoration decorationTabsOnlyTop({BorderRadiusGeometry? borderRadius}) {
    return BoxDecoration(
      borderRadius:  BorderRadius.circular(10),
      color: kPrimaryLight,


    );
  }
  static Decoration get decorationIndicator => BoxDecoration(

    color: kBlueColorE4 ,
    borderRadius:  BorderRadius.circular(10),
      border: Border.all(color: kBlueColorE4)

  );
}
