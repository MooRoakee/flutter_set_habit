import 'package:flutter/material.dart';
import 'package:set_habit/widget/habit_widget.dart';

// List<Widget> habit = new List<Widget>();
List<Widget> habit = List.generate(
    10,
    (index) => Card(
          elevation: 2,
          color: Colors.amber,
        ));
