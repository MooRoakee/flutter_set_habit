import 'dart:ui';

import 'package:flutter/material.dart';

class ripple_drawer extends StatefulWidget {
  @override
  _ripple_drawerState createState() => _ripple_drawerState();
}

class _ripple_drawerState extends State<ripple_drawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
          transform: Matrix4.translationValues(20, 100, 0)..scale(0.9),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: Column(
            children: [
              // CircleAvatar(
              //   radius: 100,
              //   backgroundImage: AssetImage('assets/img/z.png'),
              // ),
              Image(
                image: AssetImage("assets/img/z.png"),
                width: 250,
              ),

              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
                child: Opacity(
                  opacity: 0.8,
                  child: Container(

                    color: Colors.white,
                    width: 250,
                    height: 400,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
