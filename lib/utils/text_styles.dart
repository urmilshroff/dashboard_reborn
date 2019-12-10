import 'package:dashboard_reborn/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextStyles {
  static const titleStyle = TextStyle(
    fontFamily: 'Rubik',
    fontWeight: FontWeight.w600,
    fontSize: 22.0,
  ); //used for page titles on the top of the screen

  static const gradientCardTitleStyle = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 20.0, color: MyColors.white);

  static const gradientCardBodyStyle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16.0, color: MyColors.white);

  static const highlightStyle = TextStyle(
      fontFamily: 'RobotoMono',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: MyColors.accent); //used for important text
}

class TitleStyles {
  static const white = TextStyle(
    fontSize: 20.0,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontSize: 20.0,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontSize: 20.0,
    color: MyColors.primary,
  );
}

class BodyStyles {
  static const white = TextStyle(
    fontSize: 16.0,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontSize: 16.0,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontSize: 16.0,
    color: MyColors.primary,
  );
}

class BodyStylesItalic {
  static const white = TextStyle(
    fontSize: 16.0,
    color: MyColors.white,
    fontStyle: FontStyle.italic,
  );
  static const black = TextStyle(
    fontSize: 16.0,
    color: MyColors.black,
    fontStyle: FontStyle.italic,
  );
  static const primary = TextStyle(
    fontSize: 16.0,
    color: MyColors.primary,
    fontStyle: FontStyle.italic,
  );
}

class HeadingStyles {
  static const white = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class SubHeadingStyles {
  static const white = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: MyColors.primary,
  );
}

class LabelStyles {
  static const white = TextStyle(
    fontSize: 14.0,
    color: MyColors.white,
  );
  static const black = TextStyle(
    fontSize: 14.0,
    color: MyColors.black,
  );
  static const primary = TextStyle(
    fontSize: 14.0,
    color: MyColors.primary,
  );
}
