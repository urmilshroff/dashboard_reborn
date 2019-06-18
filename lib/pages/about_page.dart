import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard_reborn/main.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/textstyles.dart';
import 'package:dashboard_reborn/widgets/tile.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyAboutPage extends StatefulWidget {
  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: invertInvertColors(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 50.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios), //show moon icon
                    tooltip: 'Go back',
                    color: invertColorsStrong(context),
                    iconSize: 24.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                        color: invertColorsStrong(context)),
                  ),
                ],
              ),
            ),
//            Expanded(),
          ],
        ),
      ),
    );
  }
}
