import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:set_habit/others/constant.dart';
import 'package:set_habit/others/habitset.dart';
import 'package:set_habit/widget/habit_widget.dart';

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  void initState() {
    // habit.add(Habit(HabitSet(Colors.amber)));
    super.initState();
  }

  @override
  Widget build(Object context) {
    var width = MediaQuery.of(context).size.width; //返回context所在的窗口宽度
    var height = MediaQuery.of(context).size.height; //返回context所在的窗口高度
    var heightScaleOfHead = 0.345;

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  SizedBox(
                    height: height * heightScaleOfHead - 35,
                  ),

                  ///------------------------------------
                  ///卡片部分
                  ///------------------------------------
                  Container(
                    height: height * (1 - heightScaleOfHead) + 35,
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

                ///--------------------------------------------
                ///头部分
                ///--------------------------------------------
                Container(
                  height: height * heightScaleOfHead,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(108, 96, 224, 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),

                Column(
                  children: [
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.05),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isDrawerOpen = !isDrawerOpen;
                              xOffset = isDrawerOpen ? 290 : 0;
                              yOffset = isDrawerOpen ? 80 : 0;
                            });
                          },
                          child: isDrawerOpen
                              ? Icon(
                                  Icons.arrow_back,
                                  size: 40,
                                  color: Colors.white,
                                )
                              : Icon(Icons.dashboard_rounded,
                                  size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: width * 0.09,
                          backgroundImage: AssetImage('assets/img/profile.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.01),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '嗨，默其妙',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, top: height * 0.01),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '今日已完成 XX,剩余完成 XX',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
