import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard_reborn/main.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/textstyles.dart';
import 'package:dashboard_reborn/utils/widgets.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyMaterialPage extends StatefulWidget {
  @override
  _MyMaterialPageState createState() => _MyMaterialPageState();
}

class _MyMaterialPageState extends State<MyMaterialPage> {
  List<String> itemNames = [
    'Dope.',
  ]; //name of each individual tile

  List<Color> tileColors = [
    null,
    null,
    null,
  ]; //color of the individual tile, mapped to index values

  List<Color> splashColors = [
    MyColors.red,
    null,
    null,
  ]; //splash color of the individual tile, mapped to index values

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isThemeCurrentlyDark(context) ? MyColors.orange : MyColors.yellow,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, top: 50.0, bottom: 20.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back), //show moon icon
                    tooltip: 'Go back',
                    color: MyColors.black,
                    iconSize: 24.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Material Design',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: MyColors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 1,
                children: List.generate(itemNames.length, (index) {
                  return Hero(
                    tag: 'item0',
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
                                  color: invertColors(context)),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            )
                          ]),
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
    );
  }
}
