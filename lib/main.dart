import 'package:flutter/material.dart';
import 'package:set_habit/page/home.dart';

import 'page/drawer_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            Home(),
          ],
        ),
      ),
    );
  }
}
