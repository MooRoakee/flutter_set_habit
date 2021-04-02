import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> habit = [];

class HabitColorType {
  static int red = 0;
  static int green = 1;
  static int purple = 2;
}

class HabitDayType {
  static int red = 0;
  static int green = 1;
  static int purple = 2;
}

class HabitItem extends StatefulWidget {
  HabitItem(this.nameItem,this.habitColorType,this.habitDayType,{Key key}) : super(key: key);
  final String nameItem;
  final int habitColorType;
  final int habitDayType;

  @override
  _HabitItemState createState() => _HabitItemState();
}

class _HabitItemState extends State<HabitItem> {
  Color colorName;
  Color colorBackGround;
  Color colorProgressBar;
  bool ifEdit;

  @override
  void initState() {
    super.initState();

    ifEdit = false;
    switch(widget.habitColorType){
      case 0:
        colorName = Color.fromRGBO(255, 148, 147, 1);
        colorBackGround = Color.fromRGBO(255, 234, 233, 1);
        colorProgressBar = Color(0xFFF08281);
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBackGround,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 7),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.nameItem,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: colorName,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 0, top: 7),
                  child: IconButton(
                      icon: Icon(Icons.more_vert,size: 29,), onPressed: ()=>{
                    ifEdit = !ifEdit
                  }))
            ],
          ),

          // Padding(
          //   padding: EdgeInsets.only(right: 20, top: 20),
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: CircleAvatar(
          //       radius: 30,
          //       backgroundColor: Colors.white,
          //       child: Icon(
          //         icon,
          //         color: colorOfIcon,
          //         size: 35,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 35.0, left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.habitDayType.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container buildHabit(
  Color colorOfbackG,
  Color colorOfIcon,
  Color colorOfTime,
  String title,
  String nameOfHabit,
  IconData icon,
) {
  bool ifEdit = false;
  return Container(
    color: colorOfbackG,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 7),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    nameOfHabit,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorOfTime,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(right: 0, top: 7),
                child: IconButton(
                    icon: Icon(Icons.more_vert), onPressed: ()=>{
                      ifEdit = !ifEdit
                }))
          ],
        ),

        // Padding(
        //   padding: EdgeInsets.only(right: 20, top: 20),
        //   child: Align(
        //     alignment: Alignment.centerRight,
        //     child: CircleAvatar(
        //       radius: 30,
        //       backgroundColor: Colors.white,
        //       child: Icon(
        //         icon,
        //         color: colorOfIcon,
        //         size: 35,
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(top: 35.0, left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
