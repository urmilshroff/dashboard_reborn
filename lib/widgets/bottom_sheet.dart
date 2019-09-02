import 'dart:math' as math;
import 'dart:ui';

import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/widgets/sexy_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//this code is borrowed and then modified from https://github.com/MarcinusX/buy_ticket_design

const double minHeight = 80;
const double iconStartSize = 75;
const double iconEndSize = 110;
const double iconStartMarginTop = -15;
const double iconEndMarginTop = 50;
const double iconsVerticalSpacing = 0;
const double iconsHorizontalSpacing = 0;
AnimationController controller;

void toggleBottomSheet() =>
    controller.fling(velocity: isBottomSheetOpen ? -2 : 2);
bool get isBottomSheetOpen => (controller.status == AnimationStatus.completed);

class SexyBottomSheet extends StatefulWidget {
  @override
  _SexyBottomSheetState createState() => _SexyBottomSheetState();
}

class _SexyBottomSheetState extends State<SexyBottomSheet>
    with SingleTickerProviderStateMixin {
  double get maxHeight => MediaQuery.of(context).size.height;

  double get headerTopMargin =>
      lerp(16, 0 + MediaQuery.of(context).padding.top);

  double get itemBorderRadius => lerp(8, 15);

  double get iconLeftBorderRadius => itemBorderRadius;

  double get iconRightBorderRadius => itemBorderRadius;

  double get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(
        iconStartMarginTop,
        iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize),
      ) +
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
            onTap: toggleBottomSheet,
            onVerticalDragUpdate: handleDragUpdate,
            onVerticalDragEnd: handleDragEnd,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColor(context),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: Material(
                color: invertInvertColorsMild(context),
                elevation: 10.0,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                shadowColor: shadowColor(context),
                child: InkWell(
                  onTap: doNothing,
                  splashColor: invertColorsStrong(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: <Widget>[
                        MenuButton(),
                        for (SheetItem item in items) buildFullItem(item),
                        for (SheetItem item in items) buildIcon(item),
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

  Widget buildIcon(SheetItem item) {
    int index = items.indexOf(item);
    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Image.asset(
            'assets/images/icon/icon-nobg.png',
            fit: BoxFit.cover,
            alignment: Alignment(lerp(0, 0), 0),
          ),
        ),
      ),
    );
  }

  Widget buildFullItem(SheetItem item) {
    int index = items.indexOf(item);
    return ExpandedSheetItem(
      topMargin: iconTopMargin(index),
      leftMargin: iconLeftMargin(index),
      height: iconSize,
      isVisible: controller.status == AnimationStatus.completed,
      borderRadius: itemBorderRadius,
      title: item.title,
    );
  }

  void handleDragUpdate(DragUpdateDetails details) {
    controller.value -= details.primaryDelta / maxHeight;
  }

  void handleDragEnd(DragEndDetails details) {
    if (controller.isAnimating ||
        controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      controller.fling(
        velocity: math.max(2.0, -flingVelocity),
      );
    else if (flingVelocity > 0.0)
      controller.fling(
        velocity: math.min(-2.0, -flingVelocity),
      );
    else
      controller.fling(velocity: controller.value < 0.5 ? -2.0 : 2.0);
  }
}

class ExpandedSheetItem extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double height;
  final bool isVisible;
  final double borderRadius;
  final String title;

  const ExpandedSheetItem(
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
        child: sexyTile(
          context,
          invertColorsMaterial(context),
          MyColors.accentColor,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 100.0,
                ),
                child: Text(
                  'Press & hold me',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    color: invertColorsMild(context),
                  ),
                ),
              ),
            ],
          ),
          onTap: () => null,
        ),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        Text(
          'Fix me $title',
        ),
      ],
    );
  }
}

final List<SheetItem> items = [
  SheetItem('assets/images/icon/icon-nobg.png', 'Icon 1'),
  SheetItem('assets/images/icon/icon-nobg.png', 'Icon 2'),
  SheetItem('assets/images/icon/icon-nobg.png', 'Icon 3'),
  SheetItem('assets/images/icon/icon-nobg.png', 'Icon 4'),
];

class SheetItem {
  final String assetName;
  final String title;

  SheetItem(this.assetName, this.title);
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {}
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: toggleBottomSheet,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          size: 24.0,
          progress: controller,
          semanticLabel: 'Open/close',
          color: invertColorsMild(context),
        ),
      ),
    );
  }
}
