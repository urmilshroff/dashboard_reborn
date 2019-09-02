import 'dart:math';
import 'dart:ui';

import 'package:dashboard_reborn/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MaterialObject {
  MaterialObject(String title, IconData icon) {
    this.title = title;
    this.icon = icon;
    ColorChoice choice =
        ColorChoices.choices[Random().nextInt(ColorChoices.choices.length)];
    this.color = choice.primary;
    this.gradient = LinearGradient(
        colors: choice.gradient,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);
  }

  MaterialObject.import(
      String uuid, String title, int sortID, ColorChoice color, IconData icon) {
    this.sortID = sortID;
    this.title = title;
    this.color = color.primary;
    this.gradient = LinearGradient(
        colors: color.gradient,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);
    this.icon = icon;
    this.uuid = uuid;
  }

  String uuid;
  int sortID;
  String title;
  Color color;
  LinearGradient gradient;
  IconData icon;
}

List<MaterialObject> elements = [
  MaterialObject.import(
      'SOME_RANDOM_UUID', 'Title', 1, ColorChoices.choices[0], Icons.alarm),
  MaterialObject('Personal', Icons.person),
  MaterialObject('Work', Icons.work),
  MaterialObject('Home', Icons.home),
];
