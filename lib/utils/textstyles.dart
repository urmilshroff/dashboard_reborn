import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/widgets/tile.dart';

class MyTextStyles {
  static const titleStyle = TextStyle(
    fontFamily: 'Rubik',
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
  );

  static const headingStyle = TextStyle(
      fontFamily: 'Rubik', fontWeight: FontWeight.w600, fontSize: 20.0);

  static const bodyStyle =
      TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w500);

  static const highlightStyle = TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: MyColors.cyan);

  static const monoStyle = TextStyle(
    fontFamily: 'RobotoMono',
  );

  static const buttonStyle =
      TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w600);
}
