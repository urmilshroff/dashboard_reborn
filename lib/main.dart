import 'package:dashboard_reborn/pages/note_page.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => ThemeData(
        primaryColor: MyColors.primaryColor,
        accentColor: MyColors.accentColor,
        brightness: brightness,
        fontFamily: 'Quicksand',
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Dashboard Reborn',
          theme: theme,
          home: MyNotePage(),
        );
      },
    );
  }
}
