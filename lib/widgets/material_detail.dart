import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/utils/material_element.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MaterialDetailPage extends StatefulWidget {
  MaterialDetailPage({@required this.todoObject, Key key}) : super(key: key);

  final MaterialObject todoObject;

  @override
  _MaterialDetailPageState createState() => _MaterialDetailPageState();
}

class _MaterialDetailPageState extends State<MaterialDetailPage>
    with TickerProviderStateMixin {
  AnimationController animationBar;
  Tween<double> animT;
  AnimationController scaleAnimation;

  @override
  void initState() {
    scaleAnimation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0.0,
        upperBound: 1.0);

    scaleAnimation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: widget.todoObject.uuid + "_background",
          child: Container(
            decoration: BoxDecoration(
              color: invertInvertColorsMild(context),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Text('Hello, world!'),
        ),
      ],
    );
  }
}
