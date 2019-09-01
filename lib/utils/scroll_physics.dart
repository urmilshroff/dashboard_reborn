import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/widgets/bottom_sheet.dart';
import 'package:dashboard_reborn/widgets/sexy_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_reborn/pages/material+++.dart';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:dashboard_reborn/widgets/todo.dart';
import 'package:flutter/foundation.dart';
import 'package:dashboard_reborn/widgets/todo.dart';

class CustomScrollPhysics extends ScrollPhysics {
    CustomScrollPhysics({
        ScrollPhysics parent,
    }) : super(parent: parent);

    @override
    CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
        return CustomScrollPhysics(parent: buildParent(ancestor));
    }

    double _getPage(ScrollPosition position) {
        return position.pixels / (position.maxScrollExtent / (todos.length.toDouble() - 1));
        // return position.pixels / position.viewportDimension;
    }

    double _getPixels(ScrollPosition position, double page) {
        // return page * position.viewportDimension;
        return page * (position.maxScrollExtent / (todos.length.toDouble() - 1));
    }

    double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
        double page = _getPage(position);
        if (velocity < -tolerance.velocity)
            page -= 0.5;
        else if (velocity > tolerance.velocity) page += 0.5;
        return _getPixels(position, page.roundToDouble());
    }

    @override
    Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
        if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) || (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) return super.createBallisticSimulation(position, velocity);
        final Tolerance tolerance = this.tolerance;
        final double target = _getTargetPixels(position, tolerance, velocity);
        if (target != position.pixels) return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
        return null;
    }
}
