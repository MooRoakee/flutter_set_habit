import 'package:flutter/material.dart';
import 'package:set_habit/others/constant.dart';
import 'package:set_habit/others/habitset.dart';
import 'package:set_habit/widget/habit_widget.dart';

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  @override
  void initState() {
    habit.add(Habit(HabitSet(Colors.amber)));
    super.initState();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(children: <Widget>[
                SizedBox(
                  height: 215,
                ),
                Container(
                  height: 600,
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    // children: List.generate(50, (index) {
                    //   return Container(
                    //     child: Card(
                    //       color: Colors.amber,
                    //     ),
                    //   );
                    // }),
                    children: habit,
                  ),
                ),
              ]),
              Container(
                height: 250,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(108, 96, 224, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Positioned(
                  top: 60,
                  left: 20,
                  child: Icon(Icons.dashboard_rounded,
                      size: 40, color: Colors.white)),
              Positioned(
                top: 115,
                left: 25,
                child: Text(
                  '嗨，默其妙',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                top: 165,
                left: 25,
                child: Text(
                  '快来接着开发，别写作业了',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
