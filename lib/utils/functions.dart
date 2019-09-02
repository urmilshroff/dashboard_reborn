import 'package:dashboard_reborn/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void doNothing() {
  print('Nothing is happening here (yet)');
} //better than doing null-ing, right? ;)

bool isThemeCurrentlyDark(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) {
    return true;
  } else {
    return false;
  }
} //returns current theme status

Color invertColorsMild(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.light;
  } else {
    return MyColors.dark;
  }
} //returns appropriate mild colors for text visibility

Color invertColorsStrong(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.white;
  } else {
    return MyColors.black;
  }
} //returns appropriate strong colors for text visibility

Color invertColorsTheme(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.accentColor;
  } else {
    return MyColors.primaryColor;
  }
} //returns appropriate theme colors

Color invertColorsMaterial(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MaterialColors.orange;
  } else {
    return MaterialColors.yellow;
  }
} //returns appropriate material colors

Color invertInvertColorsMild(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.dark;
  } else {
    return MyColors.light;
  }
} //keeps the same mild colors lol

Color invertInvertColorsStrong(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return MyColors.black;
  } else {
    return MyColors.white;
  }
} //keeps the same strong colors lol

Color shadowColor(BuildContext context) {
  if (isThemeCurrentlyDark(context)) {
    return ShadowColors.shadowDark;
  } else {
    return ShadowColors.shadowLight;
  }
} //returns appropriate shadow colors

launchURL(String url) async {
  if (await canLaunch(url)) {
    print('Launching $url...');
    await launch(url);
  } else {
    print('Error launching $url!');
  }
} //opens a custom url in the system browser
