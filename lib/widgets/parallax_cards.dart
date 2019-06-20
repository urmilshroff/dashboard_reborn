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
import 'package:dashboard_reborn/pages/gradients_page.dart';
import 'package:dashboard_reborn/utils/page_transformer.dart';
import 'package:meta/meta.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class ParallaxCardsWidget extends StatelessWidget {
  ParallaxCardsWidget({
    @required this.item,
    @required this.pageVisibility,
  });

  final ParallaxCardItem item;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    var categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GradientText(
          item.body,
          shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
          gradient: isThemeCurrentlyDark(context)
              ? Gradients.coldLinear
              : Gradients.backToFuture,
          style: MyTextStyles.gradientCardBodyStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    var titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GradientText(
          item.title,
          shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
          gradient: isThemeCurrentlyDark(context)
              ? Gradients.coldLinear
              : Gradients.backToFuture,
          style: MyTextStyles.gradientCardTitleStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Positioned(
      bottom: 50.0,
      left: 10.0,
      right: 10.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          categoryText,
          titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      item.imagePath,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );

    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            MyColors.black,
          ],
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 22.0,
        horizontal: 8.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          child: Stack(
            fit: StackFit.expand,
            children: [
              image,
              imageOverlayGradient,
              _buildTextContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}
