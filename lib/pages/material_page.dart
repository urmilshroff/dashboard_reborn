import 'dart:ui';

import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/widgets/bottom_sheet.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyMaterialPage extends StatefulWidget {
  @override
  _MyMaterialPageState createState() => _MyMaterialPageState();
}

class _MyMaterialPageState extends State<MyMaterialPage> {
  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: invertColorsMaterial(context),
      body: WillPopScope(
        onWillPop: this.handleBackPressed,
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            color: invertColorsMild(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _height / 1.8,
                    width: _width / 1.2,
                    margin: EdgeInsets.all(20.0),
                    child: Material(
                      color: invertInvertColorsMild(context),
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: shadowColor(context),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        splashColor: invertColorsStrong(context),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 100.0,
                              left: 40.0,
                              child: Hero(
                                tag: 'text1',
                                child: Text(
                                  'Hello, world!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                    color: invertColorsMild(context),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 60.0,
                              left: 40.0,
                              child: Hero(
                                tag: 'text2',
                                child: Text(
                                  'Click me',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28.0,
                                    color: invertColorsMild(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: doNothing,
                      ),
                    ),
                  ),
                ],
              ),
              SexyBottomSheet(), //the awesome sliding up bottom sheet
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> handleBackPressed() {
    if (isBottomSheetOpen) {
      toggleBottomSheet();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
