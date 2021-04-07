import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:set_habit/others/constant.dart';

class HabitAdd extends StatefulWidget {
  @override
  _HabitAddState createState() => _HabitAddState();
}

class _HabitAddState extends State<HabitAdd> {
  String habitName;
  bool dayType = true;
  bool weekType = false;
  bool monthType = false;
  int habitdayType = HabitDayType.EVERYDAY;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Habit'),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Habit's Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          TextField(
            onChanged: (v) {
              habitName = v;
            },
            decoration: InputDecoration(prefixIcon: Icon(Icons.create)),

          ),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Habit's Type",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: dayType,
                    activeColor: Colors.red, //选中时的颜色
                    onChanged: (v) {
                      dayType = v;
                      weekType = false;
                      monthType = false;
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      dayType = !dayType;
                      weekType = false;
                      monthType = false;

                      setState(() {});
                    },
                    child: Text(
                      'Every Day',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: weekType,
                    activeColor: Colors.red, //选中时的颜色
                    onChanged: (value) {
                      dayType = false;
                      weekType = !weekType;
                      monthType = false;
                      habitdayType = HabitDayType.EVERYWEEK;
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      dayType = false;
                      weekType = !weekType;
                      monthType = false;
                      habitdayType = HabitDayType.EVERYWEEK;
                      setState(() {});
                    },
                    child: Text(
                      'Every Week',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: monthType,
                    activeColor: Colors.red, //选中时的颜色
                    onChanged: (v) {
                      dayType = false;
                      weekType = false;
                      monthType = !monthType;
                      habitdayType = HabitDayType.EVERYMONTH;

                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      dayType = false;
                      weekType = false;
                      monthType = !monthType;
                      habitdayType = HabitDayType.EVERYMONTH;
                      setState(() {});
                    },
                    child: Text(
                      'Every month??',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {

              //TODO: Icon pick, color pick, UI beautify
              habit.add(HabitItem(habitName,HabitColorType.purple,habitdayType,Icons.ac_unit,1));
              final snackBar = SnackBar(content: Text('Create Success!'),duration: Duration(milliseconds: 500),);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Future.delayed(Duration(milliseconds: 700),(){
                Navigator.of(context).pop();
              });
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
