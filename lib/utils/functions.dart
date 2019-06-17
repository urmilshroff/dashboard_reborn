import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/textstyles.dart';
import 'package:dashboard_reborn/widgets/tile.dart';

void doNothing() {
  print('Nothing is happening here');
}

bool isThemeCurrentlyDark(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return true;
  } else {
    return false;
  }
} //returns current theme status

Color invertColors(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.white;
  } else {
    return MyColors.black;
  }
} //returns appropriate colors for text visibility

Color invertInvertColors(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.black;
  } else {
    return MyColors.white;
  }
} //returns inappropriate colors for text invisibility (needed sometimes)

Color invertAccentColors(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.accentColor;
  } else {
    return MyColors.black;
  }
}

Color shadowColor(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.shadowDark;
  } else {
    return MyColors.shadowLight;
  }
} //returns appropriate shadow color

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  Scaffold.of(context).showSnackBar(snackBar);
} //easily show a snackbar

void navigateToPage(BuildContext context, pageToOpen) async {
  await Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return pageToOpen();
  }));
}
