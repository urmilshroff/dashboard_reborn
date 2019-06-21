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
      color: MyColors.accentColor); //used for important text
}
