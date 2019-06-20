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
import 'package:url_launcher/url_launcher.dart';

class MyAboutPage extends StatefulWidget {
  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    icon: Icon(EvaIcons.arrowIosBack),
                    tooltip: 'Go back',
                    color: invertColorsStrong(context),
                    iconSize: 26.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                        fontStyle: FontStyle.italic,
                        color: invertColorsStrong(context)),
                  ),
                ],
              ),
            ),
            Expanded(
                child: StaggeredGridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Hero(
                  tag: 'tile2',
                  child: buildTile(
                    context,
                    null,
                    invertColorsStrong(context),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
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
                                color: MyColors.heart,
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  EvaIcons.twitter,
                                  color: MyColors.twitter,
                                  size: 26.0,
                                ),
                                onPressed: () => launchURL(
                                    'https://twitter.com/urmilshroff'),
                              ),
                            ],
                          ),
                        ]),
                    onTap: () {
                      doNothing();
                    },
                  ),
                ),
                buildTile(
                  context,
                  null,
                  invertColorsStrong(context),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Dashboard Reborn is a showcase of beautiful UI elements '
                              'written purely in Dart code. The entire '
                              'project is open source, and you can use the '
                              'code however you want in your own apps.\n\nThat '
                              'said, if you liked this app or found it '
                              'helpful, please fork/star it on GitHub and give '
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
              staggeredTiles: [
                StaggeredTile.extent(2, 275.0),
                StaggeredTile.extent(2, 400.0),
              ],
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: Icon(
          EvaIcons.github,
          size: 36.0,
        ),
        tooltip: 'View GitHub repo',
        foregroundColor: invertInvertColors(context),
        backgroundColor: invertColorsStrong(context),
        elevation: 5.0,
        onPressed: () =>
            launchURL('https://github.com/urmilshroff/dashboard_reborn'),
      ),
    );
  }
}
