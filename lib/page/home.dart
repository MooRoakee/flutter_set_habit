import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:set_habit/others/constant.dart';


class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

bool isDrawerOpen = false;
bool isGesture = false;

class _MyAppState extends State<Home> with TickerProviderStateMixin {
  var height;
  double xOffset = 0;
  double yOffset = 0;
  double scaleOffset = 1;
  double rotateOffset = 0;
  double profileXOffset = 0;
  double profileRotate = 0;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    int i = 0;
    while (i < 4) {
      i++;
      habit.add(HabitItem('早睡', HabitColorType.red, HabitDayType.EVERYDAY,
          Icons.create_sharp,1));

      habit.add(HabitItem('早起', HabitColorType.purple,
          HabitDayType.EVERYDAY, Icons.insert_chart,2));
      habit.add(HabitItem('和xh吹牛', HabitColorType.green,
          HabitDayType.EVERYDAY, Icons.import_contacts_outlined,3));
    }
  }



  @override
  Widget build(Object context) {
    var width = MediaQuery.of(context).size.width; //返回context所在的窗口宽度
    height = MediaQuery.of(context).size.height; //返回context所在的窗口高度

    return SafeArea(
        child: AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleOffset)
        ..rotateZ(rotateOffset),
      duration:
          isGesture ? Duration(milliseconds: 0) : Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDrawerOpen || isGesture
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0)),
      child: ClipRRect(
        borderRadius: isDrawerOpen || isGesture
            ? BorderRadius.circular(40)
            : BorderRadius.circular(0),
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails d) {
            print('dx = ${d.delta.dx} dy = ${d.delta.dy}');


            if (!isDrawerOpen) {
              if (d.delta.dx > 0) {
                isGesture = true;
                if (xOffset + d.delta.dx <= 180) xOffset += d.delta.dx;

                if (yOffset + 0.5 * d.delta.dx <= 80)
                  yOffset += 0.5 * d.delta.dx;

                if (scaleOffset >= 0.85) scaleOffset *= 0.999;
                if (rotateOffset <= 0.25 && rotateOffset >= 0)
                  rotateOffset += 0.0005 * d.delta.dx;
                if (profileRotate <= 0.25 && profileRotate >= 0)
                  profileRotate += 0.0005 * d.delta.dx;
                if (profileXOffset <= 10) profileXOffset += 0.2;
              } else {
                if (xOffset >= 10) {
                  isGesture = true;
                  if (xOffset + d.delta.dx <= 180) xOffset += d.delta.dx;
                  if (yOffset + 0.5 * d.delta.dx <= 80)
                    yOffset += 0.5 * d.delta.dx;
                  if (scaleOffset >= 0.85) scaleOffset *= 1.001;
                  if (rotateOffset <= 0.25 && rotateOffset >= 0)
                    rotateOffset -= 0.0005;
                  if (profileRotate <= 0.25 && profileRotate >= 0)
                    profileRotate -= 0.009;
                  if (profileXOffset <= 10) profileXOffset -= 0.2;
                }
              }
            } else {
              isGesture = true;
              if (xOffset + d.delta.dx <= 180) xOffset += d.delta.dx * 1.5;
              if (yOffset + d.delta.dy >= 0) yOffset += d.delta.dx;
              if (scaleOffset >= 0.85) scaleOffset *= 1.001;
              if (rotateOffset <= 0) rotateOffset -= 0.001;
              if (profileRotate <= 0.25 && profileRotate >= 0)
                profileRotate += 0.009;
              if (profileXOffset <= 10) profileXOffset += 0.2;
            }

            setState(() {});
          },
          onPanEnd: (d) {
            if (!isDrawerOpen) {
              if (xOffset >= 180 / 2) {
                isDrawerOpen = !isDrawerOpen;
                xOffset = isDrawerOpen ? 180 : 0;
                yOffset = isDrawerOpen ? 80 : 0;
                profileXOffset = isDrawerOpen ? 35 : 0;
                scaleOffset = isDrawerOpen ? 0.85 : 1;
                rotateOffset = isDrawerOpen ? -50 : 0;
                profileRotate = isDrawerOpen ? -150 : 0;
              } else {
                xOffset = isDrawerOpen ? 180 : 0;
                yOffset = isDrawerOpen ? 80 : 0;
                profileXOffset = isDrawerOpen ? 35 : 0;
                scaleOffset = isDrawerOpen ? 0.85 : 1;
                rotateOffset = isDrawerOpen ? -50 : 0;
                profileRotate = isDrawerOpen ? -150 : 0;
              }
            } else {
              if (xOffset <= 180 / 2) {
                isDrawerOpen = !isDrawerOpen;
                xOffset = isDrawerOpen ? 180 : 0;
                yOffset = isDrawerOpen ? 80 : 0;
                profileXOffset = isDrawerOpen ? 35 : 0;
                scaleOffset = isDrawerOpen ? 0.85 : 1;
                rotateOffset = isDrawerOpen ? -50 : 0;
                profileRotate = isDrawerOpen ? -150 : 0;
              } else {
                xOffset = isDrawerOpen ? 180 : 0;
                yOffset = isDrawerOpen ? 80 : 0;
                profileXOffset = isDrawerOpen ? 35 : 0;
                scaleOffset = isDrawerOpen ? 0.85 : 1;
                rotateOffset = isDrawerOpen ? -50 : 0;
                profileRotate = isDrawerOpen ? -150 : 0;
              }
            }

            isGesture = false;
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              ///====================================
              ///头像
              ///====================================
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.02),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    transformAlignment: Alignment.center,
                    transform: Matrix4.translationValues(0, 0, 0)
                      ..rotateZ(profileRotate),
                    curve: Curves.fastOutSlowIn,
                    duration: isGesture
                        ? Duration(milliseconds: 0)
                        : Duration(milliseconds: 200),
                    child: Builder(builder: (iconContext) {
                      return InkWell(
                        onTap: () {
                          isDrawerOpen = !isDrawerOpen;
                          xOffset = isDrawerOpen ? 180 : 0;
                          yOffset = isDrawerOpen ? 80 : 0;
                          profileXOffset = isDrawerOpen ? 35 : 0;
                          scaleOffset = isDrawerOpen ? 0.85 : 1;
                          rotateOffset = isDrawerOpen ? -50 : 0;
                          profileRotate = isDrawerOpen ? -150 : 0;
                          setState(() {});
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/img/profile.png'),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              ///====================================
              ///客套话
              ///====================================
              Row(children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, top: height * 0.025),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hi, MioRoakee',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, top: height * 0.005),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '不复习考研你敲代码敲个鬼呢?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),

              ///======================================
              ///没啥用的东西
              ///======================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.03),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '今日已完成',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          '0 / ${habit.length}',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.03),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '昨日完成数',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          '0 / ${habit.length}',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              ///=======================================
              ///卡片区
              ///========================================
              Column(
                children: [
                  Container(
                    height: 558,
                    child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(width * 0.05),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        physics: BouncingScrollPhysics(),
                        childAspectRatio: .9,
                        children: habit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

}
