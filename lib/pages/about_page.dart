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
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 1,
                children: <Widget>[
                  Hero(
                    tag: 'tile2',
                    child: buildTile(
                      context,
                      null,
                      MyColors.accentColor,
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/urmil-vector.png')))),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  EvaIcons.code,
                                  color: invertColorsMild(context),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'with',
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: invertColorsStrong(context)),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  EvaIcons.heart,
                                  color: MyColors.pink,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'by',
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      color: invertColorsStrong(context)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Urmil Shroff',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0,
                                  color: invertColorsStrong(context)),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            )
                          ]),
                      onTap: () {
                        doNothing();
                      },
                    ),
                  ),
                  buildTile(
                    context,
                    null,
                    MyColors.accentColor,
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'This app is a showcase of beautiful UI elements '
                                'written in Dart & Flutter. The entire '
                                'project is open source, and you can use the '
                                'code in your own apps.\n\nThat '
                                'said, if you liked this app or found it '
                                'helpful, please star it on GitHub and give '
                                'me a shoutout.\n\nThanks!',
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
          EvaIcons.github,
          size: 32.0,
        ), //show moon icon,
        tooltip: 'View GitHub repo',
        foregroundColor: MyColors.white,
        backgroundColor: MyColors.black,
        elevation: 5.0,
        onPressed: () {
          doNothing();
        },
      ),
    );
  }
}
