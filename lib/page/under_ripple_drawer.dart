import 'package:flutter/material.dart';

class under_ripple_drawer extends StatefulWidget {
  @override
  _under_ripple_drawerState createState() => _under_ripple_drawerState();
}

class _under_ripple_drawerState extends State<under_ripple_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,

      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
