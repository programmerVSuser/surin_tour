import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../Admin/driver_home-menu.dart';
import '../../MODAL_DATA/driver_history.dart';
import '../../MODAL_DATA/driver_user_login.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController DST_UID = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<DriverModal> productModals = [];
  List<DriverHistoryModal> productModals2 = [];
  List<Widget> driverEX = [];
  @override
  Widget build(BuildContext context) {
    Size SIZE = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("พนักงานขับ เข้าสู่ระบบ"),
          backgroundColor: Colors.pink[200],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        width: 80,
                        child:
                            new Image(image: new AssetImage('image/van.gif'))),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 350,
                      height: 450,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.pink[200],
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: const ListTile(
                                leading: Icon(Icons.account_circle_outlined,
                                    size: 50, color: Colors.white),
                                title: Text('DRIVER LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                subtitle: Text('Only Trainers and Leaders',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, right: 20),
                              child: TextFormField(
                                validator: (value) {
                                  setState(() {});
                                  if (value == null || value.isEmpty) {
                                    return 'Please Fill ID Card in Blank';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: DST_UID,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'DST-UID',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 6.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, right: 20),
                              child: TextFormField(
                                validator: (value) {
                                  setState(() {});
                                  if (value == null || value.isEmpty) {
                                    return 'Please Fill ID Card in Blank';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _emailController,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 6.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 5, left: 10, right: 20),
                              child: TextFormField(
                                validator: (value) {
                                  setState(() {});
                                  if (value == null || value.isEmpty) {
                                    return ('Please Fill ID Card in Blank');
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _passwordController,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 6.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            _WidgetBottonDriverLogin()
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _WidgetBottonDriverLogin() {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("TestOK");
                    _signInWithEmailAndPasswordDriver();
                  }
                },
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPasswordDriver() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('DriverLogin')
          .snapshots()
          .listen((event) {
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          DriverModal modalAddmin = DriverModal.fromMapAddmin(map);
          productModals.add(modalAddmin);
          var A = modalAddmin;
          print('name  = ${A.driver_user}');
          setState(() {
            if (A.driver_user == _emailController.text) {
              _GetpassDriver();
            } else {}
          });
        }
      });
    }); //get the data
  }

  void _GetpassDriver() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('DriverLogin')
          .snapshots()
          .listen((event) {
        int indexs = 0;
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          DriverModal modalAddmin = DriverModal.fromMapAddmin(map);
          productModals.add(modalAddmin);
          var A = modalAddmin;
          print('pass  = ${A.pass_driver}');
          setState(() {
            if (A.pass_driver == _passwordController.text) {
              _GetUID();
            } else {}
          });
          indexs++;
        }
      });
    });
  }

  void _GetUID() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('DriverLogin')
          .snapshots()
          .listen((event) {
        int indexs = 0;
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          DriverModal modalAddmin = DriverModal.fromMapAddmin(map);
          productModals.add(modalAddmin);
          var A = modalAddmin;
          print('DriverID  = ${A.DriverID}');
          setState(() {
            if (A.DriverID == DST_UID.text) {
              print("${DST_UID.text}");
              redDataDHR();
            } else {}
          });
          indexs++;
        }
      });
    });
  }

  Future<void> redDataDHR() async {
    print("------------------------------------------------------------------");
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('Driver_history')
          .doc(DST_UID.text)
          .collection("History")
          .snapshots()
          .listen((event) {
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          DriverHistoryModal modalAddmin =
              DriverHistoryModal.fromMapAddmin(map);
          productModals2.add(modalAddmin);
          var DST = modalAddmin;
          print('DST++  = ${DST.DriverID}');
          print('DST++  = ${DST.driver_name}');
          setState(() {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => DriverHomeMeNu(
                          value1: DST.DriverID,
                          value2: DST.License_driver,
                          value3: DST.Telephone,
                          value4: DST.age,
                          value5: DST.car_registration,
                          value6: DST.driver_Email,
                          value7: DST.driver_Surname,
                          value8: DST.driver_name,
                          value9: DST.driver_user,
                          value10: DST.dwelling,
                          value11: DST.gender,
                          value12: DST.id_card,
                          value13: DST.pass_driver,
                          value14: DST.religion,
                          value15: DST.time_driver,
                        )));
          });
        }
      });
    });
  }
}
