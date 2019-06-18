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

class MyGradientsPage extends StatefulWidget {
  @override
  _MyGradientsPageState createState() => _MyGradientsPageState();
}

List<String> images = [
  'assets/images/material3.gif',
  'assets/images/material2.gif',
  'assets/images/material1.gif',
];

List<String> title = [
  'Gradient Card 3',
  'Gradient Card 2',
  'Gradient Card 1',
];

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var currentPage = images.length - 1.0;
PageController controller = PageController(initialPage: images.length - 1);

class _MyGradientsPageState extends State<MyGradientsPage> {
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              MyColors.purple,
              MyColors.blue,
            ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 50.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios), //show moon icon
                      tooltip: 'Go back',
                      color: MyColors.light,
                      iconSize: 24.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Gradient Cards',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
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
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SwipingCardsWidget extends StatelessWidget {
  var currentPage;
  var padding = 25.0;
  var verticalInset = 40.0;

  SwipingCardsWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: AspectRatio(
                aspectRatio: cardAspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                        tag: "gradient$i",
                        child: Image.asset(images[i], fit: BoxFit.cover)),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 35.0, vertical: 20.0),
                            child: Text(title[i],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                    color: MyColors.light)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
