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
import 'package:dashboard_reborn/pages/gradients_page.dart';
import 'package:dashboard_reborn/pages/material_page.dart';
import 'package:dashboard_reborn/pages/about_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> itemNames = [
      'Material++',
      'Gradient Cards',
      'About',
    ]; //name of each individual tile

    List<Color> tileColors = [
      null,
      null,
      null,
    ]; //color of the individual tile, mapped to index values

    List<Color> splashColors = [
      null,
      null,
      null,
    ]; //splash color of the individual tile, mapped to index values

    return Scaffold(
      backgroundColor: invertInvertColors(context),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 50.0, bottom: 20.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dashboard Reborn',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: invertColorsStrong(context)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.5,
                children: List.generate(itemNames.length, (index) {
                  return Hero(
                    tag: 'item$index',
                    child: buildTile(
                      context,
                      tileColors[index],
                      splashColors[index],
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${itemNames[index]}',
                              style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                  color: invertColorsStrong(context)),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            )
                          ]),
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          if (index == 0) {
                            return MyMaterialPage();
                          } else if (index == 1) {
                            return MyGradientsPage();
                          } else if (index == 2) {
                            return MyAboutPage();
                          } else {
                            return null;
                          }
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
      floatingActionButton: FloatingActionButton(
        heroTag: 'fab',
        child: isThemeCurrentlyDark(context)
            ? Icon(Icons.brightness_5) //show sun icon
            : Icon(Icons.brightness_2), //show moon icon,
        tooltip: isThemeCurrentlyDark(context)
            ? 'Switch to light mode'
            : 'Switch to dark mode',
        foregroundColor: invertInvertColors(context),
        backgroundColor: invertColorsTheme(context),
        elevation: 5.0,
        onPressed: () {
          DynamicTheme.of(context).setBrightness(
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark);
        },
      ),
    );
  }
}
