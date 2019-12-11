import 'package:dashboard_reborn/pages/home_page.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/text_styles.dart';
import 'package:dashboard_reborn/utils/ui_helpers.dart';
import 'package:dashboard_reborn/widgets/sexy_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNotePage extends StatefulWidget {
  @override
  _MyNotePageState createState() => _MyNotePageState();
}

class _MyNotePageState extends State<MyNotePage> {
  List<String> itemContent = [
    'Note: this app does nothing.',
    'Yep, you read that right! It\'s only meant to serve as a UI template for Flutter developers to use in their own apps.\n\nThe entire source code is freely available on GitHub, so you can tweak it and use it as per your liking.\n\nEnjoy, and don\'t forget to star the project on GitHub. It really helps me out!\n\n- Urmil Shroff',
  ]; //the text in the tile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: invertInvertColorsStrong(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                    style: isThemeCurrentlyDark(context)
                        ? TitleStylesDefault.white
                        : TitleStylesDefault.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Hero(
                    tag: 'tile2',
                    child: SexyTile(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              itemContent[0],
                              style: HeadingStylesDefault.accent,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              itemContent[1],
                              style: isThemeCurrentlyDark(context)
                                  ? BodyStylesDefault.white
                                  : BodyStylesDefault.black,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                      ),
                      splashColor: MyColors.accent,
                    ),
                  ),
                ],
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
        foregroundColor: invertInvertColorsStrong(context),
        backgroundColor: invertInvertColorsTheme(context),
        elevation: 5.0,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) {
                return MyHomePage();
              },
            ),
          );
        },
      ),
    );
  }
}
