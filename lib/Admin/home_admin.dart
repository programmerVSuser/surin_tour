import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../HOME/EXTEN_WALLET/credit_card_page.dart';
import 'add_user_driver.dart';
import 'delete_driver.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              //color: Colors.grey,
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'ADMIN SURIN TOUR',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
                height: 80,
                width: 80,
                child: Center(child: new Image(image: new AssetImage("image/van.gif")))),
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
                // color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Icons.directions_car,
                                          color: Colors.yellow[800],
                                          size: 30.0,
                                        ),
                                        //child: Image.asset("image/CONTACT.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: Text(
                                      "Add a tour line",
                                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.yellow[900],
                                  onPrimary: Colors.yellow[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Icons.person_add_alt_1_rounded,
                                          color: Colors.lightBlue[800],
                                          size: 30.0,
                                        ),
                                        //child: Image.asset("image/CONTACT.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: Text(
                                      "Add user driver",
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DrivingUser()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue[900],
                                  onPrimary: Colors.lightBlue[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.purple[800],
                                          size: 30.0,
                                        ),
                                        //child: Image.asset("image/CONTACT.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: Text(
                                      "Delete driver",
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                                 onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteDriver()));},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[500],
                                  onPrimary: Colors.purple[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red[800],
                                          size: 30.0,
                                        ),
                                        //child: Image.asset("image/CONTACT.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: AutoSizeText(
                                      "Delete tour",
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[900],
                                  onPrimary: Colors.red[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Icons.filter_frames_sharp,
                                          color: Colors.green[800],
                                          size: 30.0,
                                        ),
                                        //child: Image.asset("image/CONTACT.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: Text(
                                      "xxxxx",
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green[900],
                                  onPrimary: Colors.green[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.white,
                                        height: 60,
                                        width: 60,
                                        child: Icon(
                                          Icons.monetization_on,
                                          color: Colors.orange[800],
                                          size: 30.0,
                                        ),
                                        //child: Image.asset("image/CONTACT.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        child: Text(
                                      "xxxxx",
                                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[900],
                                  onPrimary: Colors.orange[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
