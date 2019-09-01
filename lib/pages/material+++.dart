import 'dart:ui';

import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/scroll_physics.dart';
import 'package:dashboard_reborn/utils/todo.dart';
import 'package:dashboard_reborn/utils/todo_detail.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dashboard_reborn/utils/functions.dart';

class MyMaterialXPage extends StatefulWidget {
  MyMaterialXPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyMaterialXPageState createState() => _MyMaterialXPageState();
}

class _MyMaterialXPageState extends State<MyMaterialXPage>
    with TickerProviderStateMixin {
  ScrollController scrollController;
  Color backgroundColor;
  LinearGradient backgroundGradient;
  Tween<Color> colorTween;
  int currentPage = 0;
  Color constBackColor;

  @override
  void initState() {
    colorTween = ColorTween(begin: todos[0].color, end: todos[0].color);
    backgroundColor = todos[0].color;
    backgroundGradient = todos[0].gradient;
    scrollController = ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      ScrollDirection direction = position.userScrollDirection;
      int page = position.pixels ~/
          (position.maxScrollExtent / (todos.length.toDouble() - 1));
      double pageDo = (position.pixels /
          (position.maxScrollExtent / (todos.length.toDouble() - 1)));
      double percent = pageDo - page;
      if (todos.length - 1 < page + 1) {
        return;
      }
      colorTween.begin = todos[page].color;
      colorTween.end = todos[page + 1].color;
      setState(() {
        backgroundColor = colorTween.lerp(percent);
        backgroundGradient =
            todos[page].gradient.lerpTo(todos[page + 1].gradient, percent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: _height / 1.5,
                      width: _width,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          TodoObject todoObject = todos[index];
                          EdgeInsets padding = const EdgeInsets.only(
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
                                        DetailPage(todoObject: todoObject),
                                    transitionsBuilder: (
                                      BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child,
                                    ) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(0.0, 1.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: SlideTransition(
                                          position: Tween<Offset>(
                                            begin: Offset.zero,
                                            end: const Offset(0.0, 1.0),
                                          ).animate(secondaryAnimation),
                                          child: child,
                                        ),
                                      );
                                    },
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: shadowColor(context),
                                          offset: const Offset(3.0, 10.0),
                                          blurRadius: 15.0)
                                    ]),
                                height: 250.0,
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: todoObject.uuid +
                                          "_background", // TODO: fix this
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: invertInvertColors(context),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        scrollDirection: Axis.horizontal,
                        physics: CustomScrollPhysics(),
                        controller: scrollController,
                        itemExtent: _width - 80,
                        itemCount: todos.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
