import 'package:flutter/material.dart';
import 'package:set_habit/others/habitset.dart';

Widget Habit(HabitSet habitSet, {MaterialColor color}) {
  return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))));
}
