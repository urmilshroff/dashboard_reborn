import 'dart:math';
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
import 'package:dashboard_reborn/widgets/swiping_cards.dart';
import 'package:dashboard_reborn/widgets/parallax_cards.dart';
import 'package:dashboard_reborn/utils/page_transformer.dart';

List<String> swipingCardImages = [
  'assets/images/wallpaper11.jpg',
  'assets/images/wallpaper10.jpg',
  'assets/images/wallpaper9.jpg',
  'assets/images/wallpaper8.jpg',
  'assets/images/wallpaper7.jpg',
];

List<String> swipingCardTitles = [
  'Gradient Card 5',
  'Gradient Card 4',
  'Gradient Card 3',
  'Gradient Card 2',
  'Gradient Card 1',
];

List<Color> gradientStartColors = [
  GradientColors.blue,
  GradientColors.purple,
  GradientColors.blue,
  GradientColors.purple,
  GradientColors.blue,
  GradientColors.purple,
];

List<Color> gradientEndColors = [
  GradientColors.purple,
  GradientColors.blue,
  GradientColors.purple,
  GradientColors.blue,
  GradientColors.purple,
  GradientColors.blue,
];

class ParallaxCardItem {
  ParallaxCardItem({
    this.title,
    this.body,
    this.imagePath,
  });

  final String title;
  final String body;
  final String imagePath;
}

final parallaxCardItemsList = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'Card Title',
    body: 'Card Category',
    imagePath: 'assets/images/wallpaper1.jpg',
  ),
  ParallaxCardItem(
    title: 'Card Title',
    body: 'Card Category',
    imagePath: 'assets/images/wallpaper2.jpg',
  ),
  ParallaxCardItem(
    title: 'Card Title',
    body: 'Card Category',
    imagePath: 'assets/images/wallpaper3.jpg',
  ),
//  ParallaxCardItem(
//    title: 'Card Title',
//    body: 'Card Category',
//    imagePath: 'assets/images/wallpaper4.jpg',
//  ),
//  ParallaxCardItem(
//    title: 'Card Title',
//    body: 'Card Category',
//    imagePath: 'assets/images/wallpaper5.jpg',
//  ),
];

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var gradientStartColor;
var gradientEndColor;
PageController controller =
    PageController(initialPage: swipingCardImages.length - 1);
var i = swipingCardImages.length - 1;

class MyGradientsPage extends StatefulWidget {
  @override
  _MyGradientsPageState createState() => _MyGradientsPageState();
}

class _MyGradientsPageState extends State<MyGradientsPage> {
  var currentPage = swipingCardImages.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: swipingCardImages.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            gradientStartColors[i],
            gradientEndColors[i],
          ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
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
                      color: MyColors.light,
                      iconSize: 22.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Gradient Cards',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                          color: MyColors.light),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  SwipingCardsWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: swipingCardImages.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: SizedBox.fromSize(
                  size: Size.fromHeight(500.0),
                  child: PageTransformer(
                    pageViewBuilder: (context, visibilityResolver) {
                      return PageView.builder(
                        controller: PageController(viewportFraction: 0.85),
                        itemCount: parallaxCardItemsList.length,
                        itemBuilder: (context, index) {
                          final item = parallaxCardItemsList[index];
                          final pageVisibility =
                              visibilityResolver.resolvePageVisibility(index);

                          return ParallaxCardsWidget(
                            item: item,
                            pageVisibility: pageVisibility,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
