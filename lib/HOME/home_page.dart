import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:may/HOME_ACCOUNT/home_menu_account.dart';

import 'ECTEN_HOMEMENU/conditions_page.dart';
import 'ECTEN_HOMEMENU/contact_page.dart';
import 'ECTEN_HOMEMENU/driver_page.dart';
import 'ECTEN_HOMEMENU/location_page.dart';
import 'ECTEN_HOMEMENU/walet_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//*****************************************************
  int _currentIndex = 0;
  List cardList = [Item1(), Item2(), Item3(), Item4()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
      print(i);
    }
    return result;
  }
//*****************************************************

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text(
          'Home menu',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              showAlert2('Do you want to log out?',
                  'Press the Next button to exit.');
            },
          ),
          IconButton(
            onPressed: () {
              showAlert3('Are you the driver?',
                  '- Press next to enter your ID\n- Press Cancel to leave this page.');
            },
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(

              padding: EdgeInsets.only(left: 12, right: 12),
              //color: Colors.grey,
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'SURIN TOUR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              //color: Colors.grey,
              height: 35,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: AutoSizeText(
                  'Welcome application surin tour, convenient and safe',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.blueAccent,
                      child: card,
                    ),
                  );
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
          SizedBox(height: 10,),
          Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'MORE MENU',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20,left: 20,top: 20,),
                  child: Row(
                    children: [
                      Expanded(
                        child:Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5,right: 5),
                                    color: Colors.white,
                                    height: 60,
                                    width: 60,
                                    child: Icon(
                                      Icons.question_answer,
                                      color: Colors.yellow[800],
                                      size: 30.0,
                                    ),
                                    //child: Image.asset("image/CONTACT.png"),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(child: Text("Contact")),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Contact()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.yellow[200],
                              onPrimary: Colors.yellow[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child:Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5,right: 5),
                                    color: Colors.white,
                                    height: 60,
                                    width: 60,
                                    child: Icon(
                                      Icons.add_box,
                                      color: Colors.lightBlue[800],
                                      size: 30.0,
                                    ),
                                    //child: Image.asset("image/CONTACT.png"),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(child: Text("Reserve")),
                              ],
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue[200],
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
                  padding: EdgeInsets.only(right: 20,left: 20,top: 20,),
                  child: Row(
                    children: [
                      Expanded(
                        child:Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5,right: 5),
                                    color: Colors.white,
                                    height: 60,
                                    width: 60,
                                    child: Icon(
                                      Icons.pin_drop,
                                      color: Colors.purple[800],
                                      size: 30.0,
                                    ),
                                    //child: Image.asset("image/CONTACT.png"),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(child: Text("location")),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MMap()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[200],
                              onPrimary: Colors.purple[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child:Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5,right: 5),
                                    color: Colors.white,
                                    height: 60,
                                    width: 60,
                                    child: Icon(
                                      Icons.event_note_sharp,
                                      color: Colors.red[800],
                                      size: 30.0,
                                    ),
                                    //child: Image.asset("image/CONTACT.png"),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(child: AutoSizeText("Conditions")),
                              ],
                            ),
                            onPressed: () {
                              //Conditions
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Conditions()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[200],
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
                  padding: EdgeInsets.only(right: 20,left: 20,top: 20,),
                  child: Row(
                    children: [
                      Expanded(
                        child:Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5,right: 5),
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
                                SizedBox(height: 5,),
                                Container(child: Text("Bill")),
                              ],
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[200],
                              onPrimary: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child:Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            child: Column(
                              children: [
                                SizedBox(height: 15,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5,right: 5),
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
                                SizedBox(height: 5,),
                                Container(child: Text("Wallet")),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet()));
                              //Wallrt
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange[200],
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
          ],
        ),
      ),
    );
  }
  Future<void> showAlert2(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.deepOrange[800]),
                  )),
              FlatButton(
                  onPressed: () {
                    auth.signOut().then((value) => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeMenuAccount())));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.green),
                  )),
            ],
          );
        });
  }
  Future<void> showAlert3(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.deepOrange[800]),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => driver()));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.green),
                  )),
            ],
          );
        });
  }
}

class Item1 extends StatelessWidget {
  //const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "image/T1.jfif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  //const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "image/T2.jfif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  //const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "image/T3.jfif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  //const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xff49a09d), Color(0xff49a09d)]),
      ),
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "image/T4.jfif",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
