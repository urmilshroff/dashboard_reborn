import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/widgets/bottom_sheet.dart';
import 'package:dashboard_reborn/widgets/tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMaterialPage extends StatefulWidget {
  @override
  _MyMaterialPageState createState() => _MyMaterialPageState();
}

class _MyMaterialPageState extends State<MyMaterialPage> {
  @override
  Widget build(BuildContext context) {
    List<String> itemNames = [
      'Go ahead,',
      'Swipe up from below.',
    ]; //name of each individual tile

    List<Color> tileColors = [
      null,
      null,
      null,
    ]; //color of the individual tile, mapped to index values

    List<Color> splashColors = [
      MyColors.accentColor,
      null,
      null,
    ]; //splash color of the individual tile, mapped to index values

    return Scaffold(
      backgroundColor: invertColorsMaterial(context), //color changes
      // according to currently set theme
      body: Container(
        child: Stack(children: <Widget>[
          Column(
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
                      color: invertColorsMild(context),
                      iconSize: 26.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Material++',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                          fontStyle: FontStyle.italic,
                          color: invertColorsMild(context)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 1,
                  children: List.generate(1, (index) {
                    return Hero(
                      tag: 'tile0',
                      child: buildTile(
                        context,
                        tileColors[0],
                        splashColors[0],
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${itemNames[0]}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                    color: invertColorsMild(context)),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '${itemNames[1]}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                    color: invertColorsMild(context)),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
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
          SexyBottomSheet(), //the awesome sliding up bottom sheet
        ]),
      ),
    );
  }
}
