import 'dart:ui';

import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/material_element.dart';
import 'package:dashboard_reborn/widgets/bottom_sheet.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyMaterialPage extends StatefulWidget {
  @override
  _MyMaterialPageState createState() => _MyMaterialPageState();
}

class _MyMaterialPageState extends State<MyMaterialPage>
    with TickerProviderStateMixin {
  ScrollController scrollController;
  Color backgroundColor;
  LinearGradient backgroundGradient;
  Tween<Color> colorTween;
  int currentPage = 0;
  Color constBackColor;

  @override
  void initState() {
    colorTween = ColorTween(begin: elements[0].color, end: elements[0].color);
    backgroundColor = elements[0].color;
    backgroundGradient = elements[0].gradient;
    scrollController = ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      ScrollDirection direction = position.userScrollDirection;
      int page = position.pixels ~/
          (position.maxScrollExtent / (elements.length.toDouble() - 1));
      double pageDo = (position.pixels /
          (position.maxScrollExtent / (elements.length.toDouble() - 1)));
      double percent = pageDo - page;
      if (elements.length - 1 < page + 1) {
        return;
      }
      colorTween.begin = elements[page].color;
      colorTween.end = elements[page + 1].color;
      setState(() {
        backgroundColor = colorTween.lerp(percent);
        backgroundGradient = elements[page]
            .gradient
            .lerpTo(elements[page + 1].gradient, percent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

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
                  Hero(
                    tag: 'tile0',
                    child: Container(
                      height: _height / 1.6,
                      width: _width / 1.2,
                      margin: EdgeInsets.all(15.0),
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
                              Center(child: Text('Hello, world!')),
                            ],
                          ),
                          onTap: doNothing,
                        ),
                      ),
                    ),
                  )
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
