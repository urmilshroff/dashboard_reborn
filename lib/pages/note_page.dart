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
import 'package:dashboard_reborn/pages/home_page.dart';
import 'package:dashboard_reborn/pages/about_page.dart';

class MyNotePage extends StatefulWidget {
  @override
  _MyNotePageState createState() => _MyNotePageState();
}

class _MyNotePageState extends State<MyNotePage> {
  List<String> itemNames = [
    'Note: this app does nothing.',
    'Yep, you read that right.\n\nIts main purpose is to serve as a template '
        'or starting point for Flutter developers and designers to use in '
        'their own apps.\n\nThe entire source code is up and available for '
        'free on GitHub, and you have the liberty to do anything you want '
        'with it.\n\nThat said, if you are using the code or like this app, '
        'please star it on GitHub and give me a shoutout. Thanks!\n\n- Urmil Shroff',
  ];

  List<Color> tileColors = [
    null,
    null,
    null,
    null,
  ]; //color of the individual tile, mapped to index values

  List<Color> splashColors = [
    MyColors.accentColor,
    null,
    null,
    null,
    null,
  ]; //splash color of the individual tile, mapped to index values
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: invertInvertColors(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 60.0,
                bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome!',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                        color: invertColorsStrong(context)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 0.75,
                children: List.generate(1, (index) {
                  return Hero(
                    tag: 'item2',
                    child: buildTile(
                      context,
                      tileColors[0],
                      splashColors[0],
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '${itemNames[0]}',
                                  style: MyTextStyles.highlightStyle,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  '${itemNames[1]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: invertColorsStrong(context)),
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ]),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return MyHomePage();
                        }));
                      },
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: Icon(Icons.check),
        tooltip: 'Accept',
        foregroundColor: invertInvertColors(context),
        backgroundColor: invertColorsTheme(context),
        elevation: 5.0,
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return MyHomePage();
          }));
        },
      ),
    );
  }
}
