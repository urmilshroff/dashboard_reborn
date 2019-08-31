import 'package:dashboard_reborn/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//this is the main tile builder taken and modified from https://github.com/Ivaskuu/dashboard

Widget sexyTile(
    BuildContext context, Color color, Color splashColor, Widget child,
    {Function() onTap}) {
  return Container(
    margin: EdgeInsets.all(15.0),
    child: Material(
      color: color,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(15.0),
      shadowColor: shadowColor(context),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap != null
            ? () => onTap()
            : () {
                print('Nothing set yet!');
              },
        child: child,
        splashColor: splashColor, //additional parameters to customize the
        // colors on a per-tile basis
      ),
    ),
  );
}
