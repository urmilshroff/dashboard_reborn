import 'dart:ui';

import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/material_element.dart';
import 'package:dashboard_reborn/utils/scroll_physics.dart';
import 'package:dashboard_reborn/widgets/bottom_sheet.dart';
import 'package:dashboard_reborn/widgets/material_card_expanded.dart';
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
                    height: _height / 1.5,
                    width: _width,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        MaterialObject todoObject = elements[index];
                        EdgeInsets padding = EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 20.0, bottom: 30.0);

                        return Padding(
                          padding: padding,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) =>
                                      MaterialCardExpanded(
                                          todoObject: todoObject),
                                  transitionsBuilder: (
                                    BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child,
                                  ) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(0.0, 1.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset.zero,
                                          end: Offset(0.0, 1.0),
                                        ).animate(secondaryAnimation),
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowColor(context),
                                        offset: Offset(3.0, 10.0),
                                        blurRadius: 15.0)
                                  ]),
                              height: 250.0,
                              child: Stack(
                                children: <Widget>[
                                  Hero(
                                    tag: 'matCard$index', // TODO: fix this
                                    child: Material(
                                      color: invertInvertColorsMild(context),
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(10.0),
                                      shadowColor: shadowColor(context),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        splashColor:
                                            invertColorsStrong(context),
                                        child: Padding(
                                          padding: EdgeInsets.all(30.0),
                                          child: Center(
                                            child: Text(
                                              'Swipe left, right, up or down.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.0,
                                                color:
                                                    invertColorsMild(context),
                                              ),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      scrollDirection: Axis.horizontal,
                      physics: CustomScrollPhysics(),
                      controller: scrollController,
                      itemExtent: _width - _width / 5,
                      itemCount: elements.length,
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
