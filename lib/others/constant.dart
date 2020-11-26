import 'package:flutter/material.dart';

// List<Widget> habit = new List<Widget>();
List<Widget> habit = List.generate(
    30,
    (index) => Card(
          elevation: 0,
          color: Color.fromRGBO(227, 255, 239, 1),
        ));
