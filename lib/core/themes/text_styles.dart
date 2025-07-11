import 'package:onservice24/src/main_index.dart';


const kTextLabel = TextStyle(
  color: kPrimaryDark,
  fontFamily: Fonts.regular,
  height: 1.2, //SETTING THIS CAN SOLVE YOUR PROBLEM
);
const kTextLabelWhite = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontFamily: Fonts.regular,
);
const kTextLabelNormal = TextStyle(
  color: kPrimaryDark,
  fontSize: 14.0,
  fontFamily: Fonts.regular,
);
const kTextLabelSmall = TextStyle(
  color: Colors.black,
  fontSize: 10.0,
  fontFamily: Fonts.regular,
);

const kTextLabelFontDark = TextStyle(
  color: kPrimaryDark,
  fontSize: 16.0,
  fontFamily: Fonts.regular,
);
const kAppBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.elliptical(500, 50),
  ),
);

const kTextMedium = TextStyle(
  color: kPrimaryDark,
  fontSize: 16.0,
  height: 1.2, //SETTING THIS CAN SOLVE YOUR PROBLEM
  fontFamily: Fonts.medium,
);
const kTextSemiBold = TextStyle(
  color: kPrimaryDark,
  fontSize: 20.0,
  height: 1,
  fontFamily: Fonts.bold,
);
const kDrawerItemStyle =
TextStyle(fontFamily: Fonts.regular, fontSize: 15, color: kPrimaryDark);

const kTextRegular = TextStyle(
  color: kPrimaryDark,
  fontSize: 16.0,
  fontFamily: Fonts.regular,
);

const kTextLight = TextStyle(
  color: kPrimaryDark,
  fontSize: 12.0,
  fontFamily: Fonts.light,
);
final kTextRegularPrimary =
kTextRegular.copyWith(color: kPrimaryDark, fontSize: 12);

const kTextBold = TextStyle(
  color: kPrimaryDark,
  fontSize: 16.0,
  fontFamily: Fonts.bold,
);

const kTextBoldTitle = TextStyle(
  color: kPrimaryDark,
  fontSize: 18.0,
  fontFamily: Fonts.bold,
);
const kTextBoldSmall = TextStyle(
  color: kPrimaryDark,
  fontSize: 11.0,
  fontFamily: Fonts.bold,
);

const kTextBodyBold = TextStyle(
  color: kPrimaryDark,
  fontSize: 14.0,
  fontFamily: Fonts.bold,
);

const kTextExtraBold = TextStyle(
  color: kPrimaryDark,
  fontSize: 18.0,
  fontFamily: Fonts.bold,
);

const kProfileFieldDecoration = InputDecoration(
    fillColor: kPrimaryLight,
    filled: true,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ));


const kTextFieldDecoration = InputDecoration(

  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
  border:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color:  kBorderColor),
  ),
  focusedBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color:  kBorderColor),
  ),

  enabledBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: kBorderColor),
  ),
);


const kButtonTextStyle = TextStyle(
  fontSize: 24.0,
  color: Colors.white,
  fontFamily: Fonts.medium,
);
