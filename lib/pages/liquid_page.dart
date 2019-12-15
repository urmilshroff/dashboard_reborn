import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/text_styles.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class MyLiquidPage extends StatefulWidget {
  @override
  _MyLiquidPageState createState() => _MyLiquidPageState();
}

class _MyLiquidPageState extends State<MyLiquidPage> {
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: MyColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 350,
                  child: FlareActor(
                    'assets/flare/card.flr',
                    animation: 'animation',
                  ),
                ),
                Text(
                  '<< Swipe >>',
                  style: SubHeadingStylesMaterial.dark,
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        color: MyColors.accent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 350,
                  child: FlareActor(
                    'assets/flare/card.flr',
                    animation: 'animation',
                  ),
                ),
                Text(
                  '<< Swipe >>',
                  style: SubHeadingStylesMaterial.dark,
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        color: MyColors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 350,
                  child: FlareActor(
                    'assets/flare/card.flr',
                    animation: 'animation',
                  ),
                ),
                Text(
                  '<< Swipe >>',
                  style: SubHeadingStylesMaterial.light,
                ),
              ],
            )
          ],
        ),
      ),
    ];

    return LiquidSwipe(
      pages: pages,
      initialPage: 0,
      fullTransitionValue: 350.0,
      enableLoop: true,
      waveType: WaveType.liquidReveal,
    );
  }
}
