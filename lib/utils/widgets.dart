import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/textstyles.dart';

Widget buildTile(
    BuildContext context, Color color, Color splashColor, Widget child,
    {Function() onTap}) {
  return Container(
    margin: const EdgeInsets.all(15.0),
    child: Material(
        color: color,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: shadowColor(context),
        child: InkWell(
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Nothing set yet!');
                },
          child: child,
          splashColor: splashColor,
        )),
  );
}
