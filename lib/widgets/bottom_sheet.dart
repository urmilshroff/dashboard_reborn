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

const double minHeight = 80;
const double iconStartSize = 75;
const double iconEndSize = 110;
const double iconStartMarginTop = -15;
const double iconEndMarginTop = 50;
const double iconsVerticalSpacing = 0;
const double iconsHorizontalSpacing = 0;
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

  double get itemBorderRadius => lerp(8, 15);

  double get iconLeftBorderRadius => itemBorderRadius;

  double get iconRightBorderRadius => itemBorderRadius;

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
                elevation: 10.0,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
                shadowColor: shadowColor(context),
                child: InkWell(
                  onTap: doNothing,
                  splashColor: MyColors.accentColor,
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
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Image.asset(
            'assets/images/material2.gif',
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
      controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      controller.fling(velocity: math.min(-2.0, -flingVelocity));
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
        child: buildTile(
          context,
          invertColorsMaterial(context),
          MyColors.pink,
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100.0,
                  ),
                  child: Text(
                    'Press & hold me',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                        color: invertColorsMild(context)),
                  ),
                ),
              ]),
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
  SheetItem('assets/images/material1.gif', 'Material 1'),
  SheetItem('assets/images/material2.gif', 'Material 2'),
  SheetItem('assets/images/material3.gif', 'Material 3'),
  SheetItem('assets/images/material4.gif', 'Material 4'),
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
            onTap: toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              size: 24.0,
              progress: controller,
              semanticLabel: 'Open/close',
              color: invertColorsMild(context),
            )));
  }
}
