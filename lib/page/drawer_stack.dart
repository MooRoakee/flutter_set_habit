import 'package:flutter/material.dart';
import 'package:set_habit/page/ripple_drawer.dart';
import 'package:set_habit/page/under_ripple_drawer.dart';

class drawer_stack extends StatefulWidget {
  @override
  _drawer_stackState createState() => _drawer_stackState();
}

class _drawer_stackState extends State<drawer_stack> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        ripple_drawer(),
        under_ripple_drawer()
      ],),
    );
  }
}
