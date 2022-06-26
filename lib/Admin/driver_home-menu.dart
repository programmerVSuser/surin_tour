
import 'package:flutter/material.dart';
class DriverHomeMeNu extends StatefulWidget {
  //------------------------------------------
  late String value1;
  late String value2;
  late String value3;
  late String value4;
  late String value5;
  late String value6;
  late String value7;
  late String value8;
  late String value9;
  late String value10;
  late String value11;
  late String value12;
  late String value13;
  late String value14;
  late String value15;
  DriverHomeMeNu({
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
    required this.value6,
    required this.value7,
    required this.value8,
    required this.value9,
    required this.value10,
    required this.value11,
    required this.value12,
    required this.value13,
    required this.value14,
    required this.value15,

  });
  @override
  _DriverHomeMeNuState createState() => _DriverHomeMeNuState(
      value1,
      value2,
      value3,
      value4,
      value5,
      value6,
      value7,
      value8,
      value9,
      value10,
      value11,
      value12,
      value13,
      value14,
      value15,
  );
}
//----------------------------------------------------------------------------
class _DriverHomeMeNuState extends State<DriverHomeMeNu> {
  @override
  //--------------------------------------------------------
  late String value1;
  late String value2;
  late String value3;
  late String value4;
  late String value5;
  late String value6;
  late String value7;
  late String value8;
  late String value9;
  late String value10;
  late String value11;
  late String value12;
  late String value13;
  late String value14;
  late String value15;
  _DriverHomeMeNuState(
      this.value1,
      this.value2,
      this.value3,
      this.value4,
      this.value5,
      this.value6,
      this.value7,
      this.value8,
      this.value9,
      this.value10,
      this.value11,
      this.value12,
      this.value13,
      this.value14,
      this.value15,
      );
  //--------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.addchart_rounded),
                text: "ข้อมูลตั๋ว",
              ),
              Tab(icon: Icon(Icons.event_note_sharp), text: "เช็คคนบนรถ"),
              GestureDetector(
                onTap: () {},
                child: Tab(icon: Icon(Icons.person), text: "ข้อมูลส่วนตัว"),
              ),
            ],
          ),
          title: Text('Driver'),
        ),
        body: TabBarView(
          children: [
            Center(
                child: Container(
              child: Text(""),
            )),
            Center(
                child: Container(
              child: Column(
                children: [
                  Text("1  $value1"),
                  Text("2  $value2"),
                  Text("3  $value3"),
                  Text("4  $value4"),
                  Text("5  $value5"),
                  Text("6  $value6"),
                  Text("7  $value7"),
                  Text("8  $value8"),
                  Text("9  $value9"),
                  Text("10  $value10"),
                  Text("11  $value11"),
                  Text("12  $value12"),
                  Text("13  $value13"),
                  Text("14  $value14"),
                  Text("15  $value15"),
                ],
              ),
            )),
            Center(
                child: Container(
                  child: Text(""),
                )),
          ],
        ),
      ),
    );
  }
}