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
    // habit.add(Habit(HabitSet(Colors.amber)));
    super.initState();
  }

  @override
  Widget build(Object context) {
    var deviceData = MediaQuery.of(context); // 返回 MediaQueryData
    var width = deviceData.size.width; //返回context所在的窗口宽度
    var height = deviceData.size.height; //返回context所在的窗口高度
    var heightScaleOfHead = 0.345;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(children: <Widget>[
                SizedBox(
                  height: height*heightScaleOfHead-30,
                ),

                ///------------------------------------
                ///卡片部分
                ///------------------------------------
                Container(
                  height: height*(1-heightScaleOfHead)+30,
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
                height: height*heightScaleOfHead,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(108, 96, 224, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Positioned(
                  top: 50,
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
                  '阿巴阿巴',
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
