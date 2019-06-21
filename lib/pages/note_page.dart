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
  List<String> itemContent = [
    'Note: this app does nothing.',
    'Yep, you read that right! It\'s only meant to serve as a UI template for'
        ' Flutter developers to use in their own apps.\n\nThe '
        'entire source code is freely available on GitHub, and you can tweak '
        'it and use it as per your liking.\n\nEnjoy, and don\'t forget'
        ' to star the project on GitHub. It really helps me out!\n\n- Urmil '
        'Shroff',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                childAspectRatio: 0.8,
                children: List.generate(1, (index) {
                  return Hero(
                    tag: 'tile2',
                    child: buildTile(
                      context,
                      null,
                      MyColors.accentColor,
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  itemContent[0],
                                  style: MyTextStyles.highlightStyle,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  itemContent[1],
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      fontWeight: FontWeight.w400,
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
                        doNothing();
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
        child: Icon(
          EvaIcons.checkmark,
          size: 30.0,
        ),
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
