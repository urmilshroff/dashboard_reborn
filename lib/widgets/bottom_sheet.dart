import 'dart:math' as math;
import 'dart:ui';
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

const double minHeight = 75;
const double iconStartSize = 60;
const double iconEndSize = 80;
const double iconStartMarginTop = -15;
const double iconEndMarginTop = 50;
const double iconsVerticalSpacing = 20;
const double iconsHorizontalSpacing = 20;
AnimationController controller;

void toggle() {
  final bool isOpen = controller.status == AnimationStatus.completed;
  controller.fling(velocity: isOpen ? -2 : 2);
}

class SexyBottomSheet extends StatefulWidget {
  @override
  _SexyBottomSheetState createState() => _SexyBottomSheetState();
}

class _SexyBottomSheetState extends State<SexyBottomSheet>
    with SingleTickerProviderStateMixin {
  double get maxHeight => MediaQuery.of(context).size.height;

  double get headerTopMargin =>
      lerp(16, 0 + MediaQuery.of(context).padding.top);

  double get headerFontSize => lerp(16, 24);

  double get itemBorderRadius => lerp(8, 15);

  double get iconLeftBorderRadius => itemBorderRadius;

  double get iconRightBorderRadius => lerp(8, 0);

  double get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(iconStartMarginTop,
          iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize)) +
      headerTopMargin;

  double iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) => lerpDouble(min, max, controller.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor(context),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Material(
                elevation: 50.0,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                shadowColor: shadowColor(context),
                child: InkWell(
                  onTap: null,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: <Widget>[
                        MenuButton(),
                        SheetHeader(
                          fontSize: headerFontSize,
                          topMargin: headerTopMargin,
                        ),
                        for (Book book in books) _buildFullItem(book),
                        for (Book book in books) _buildIcon(book),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIcon(Book book) {
    int index = books.indexOf(book);
    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(iconLeftBorderRadius),
            right: Radius.circular(iconRightBorderRadius),
          ),
          child: Image.asset(
            'assets/images/material1.gif',
            fit: BoxFit.cover,
            alignment: Alignment(lerp(1, 0), 0),
          ),
        ),
      ),
    );
  }

  Widget _buildFullItem(Book book) {
    int index = books.indexOf(book);
    return ExpandedBookItem(
      topMargin: iconTopMargin(index),
      leftMargin: iconLeftMargin(index),
      height: iconSize,
      isVisible: controller.status == AnimationStatus.completed,
      borderRadius: itemBorderRadius,
      title: book.title,
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      controller.fling(velocity: controller.value < 0.5 ? -2.0 : 2.0);
  }
}

class ExpandedBookItem extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double height;
  final bool isVisible;
  final double borderRadius;
  final String title;

  const ExpandedBookItem(
      {Key key,
      this.topMargin,
      this.height,
      this.isVisible,
      this.borderRadius,
      this.title,
      this.leftMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: buildTile(
          context,
          MyColors.white,
          MyColors.red,
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Material++',
                  style: MyTextStyles.headingStyle,
                ),
              ]),
          onTap: () => null,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

final List<Book> books = [
  Book('assets/images/material2.gif', 'Material 1'),
  Book('assets/images/material2.gif', 'Material 2'),
  Book('assets/images/material2.gif', 'Material 3'),
  Book('assets/images/material2.gif', 'Material 4'),
];

class Book {
  final String assetName;
  final String title;

  Book(this.assetName, this.title);
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        '',
        style: MyTextStyles.titleStyle,
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 30,
        child: GestureDetector(
            onTap: toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: controller,
              semanticLabel: 'Open/close',
              color: MyColors.dark,
            )));
  }
}
