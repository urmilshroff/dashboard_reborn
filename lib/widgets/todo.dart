import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dashboard_reborn/main.dart';
import 'dart:collection';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/utils/functions.dart';
import 'package:dashboard_reborn/widgets/bottom_sheet.dart';
import 'package:dashboard_reborn/widgets/sexy_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:dashboard_reborn/widgets/todo.dart';
import 'package:flutter/foundation.dart';

class TodoObject {
    TodoObject(String title, IconData icon) {
        this.title = title;
        this.icon = icon;
        ColorChoice choice = ColorChoices.choices[new Random().nextInt(ColorChoices.choices.length)];
        this.color = choice.primary;
        this.gradient = LinearGradient(colors: choice.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
        tasks = new Map<DateTime, List<TaskObject>>();
    }

    TodoObject.import(String uuidS, String title, int sortID, ColorChoice color, IconData icon, Map<DateTime, List<TaskObject>> tasks) {
        this.sortID = sortID;
        this.title = title;
        this.color = color.primary;
        this.gradient = LinearGradient(colors: color.gradient, begin: Alignment.bottomCenter, end: Alignment.topCenter);
        this.icon = icon;
        this.tasks = tasks;
        this.uuid = uuidS;
    }

    String uuid;
    int sortID;
    String title;
    Color color;
    LinearGradient gradient;
    IconData icon;
    Map<DateTime, List<TaskObject>> tasks;

    int taskAmount() {
        int amount = 0;
        tasks.values.forEach((list) {
            amount += list.length;
        });
        return amount;
    }

    //List<TaskObject> tasks;

    double percentComplete() {
        if (tasks.isEmpty) {
            return 1.0;
        }
        int completed = 0;
        int amount = 0;
        tasks.values.forEach((list) {
            amount += list.length;
            list.forEach((task) {
                if (task.isCompleted()) {
                    completed++;
                }
            });
        });
        return completed / amount;
    }
}

class TaskObject {
    DateTime date;
    String task;
    bool _completed;

    TaskObject(String task, DateTime date) {
        this.task = task;
        this.date = date;
        this._completed = false;
    }

    TaskObject.import(String task, DateTime date, bool completed) {
        this.task = task;
        this.date = date;
        this._completed = completed;
    }

    void setComplete(bool value) {
        _completed = value;
    }

    isCompleted() => _completed;
}
