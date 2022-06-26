import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MODAL_DATA/admin_user_login.dart';
import 'home_admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<AddminModal> productModals2 = [];

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.orange[400],
            title: Text(
              "เเอดมิน เข้าสุ่ระบบ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      child: new Image(image: new AssetImage("image/van.gif"))),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _emailController,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        labelText: 'Email :',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 50, right: 50),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        labelText: 'Password :',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: A.width * 0.4,
                    child: ElevatedButton(
                      child: Text("Login"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _signInWithEmailAndPasswordADDMIN();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[600],
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPasswordADDMIN() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('AdminLogin')
          .snapshots()
          .listen((event) {
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          AddminModal modalAddmin = AddminModal.fromMapAddmin(map);
          productModals2.add(modalAddmin);
          //nane product
          var A = modalAddmin;
          print('name  = ${A.email}');
          setState(() {
            if (A.email == _emailController.text) {
              _Getpass();
            } else {
              String title = "wrong information email";
              String message = "Please fill out the correct information.";
              _dialogSing1(title, message);
            }
          });
        }
      });
    }); //get the data
  }

  void _Getpass() async {
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('AdminLogin')
          .snapshots()
          .listen((event) {
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          AddminModal modalAddmin = AddminModal.fromMapAddmin(map);
          productModals2.add(modalAddmin);
          //nane product
          var A = modalAddmin;
          print('pass  = ${A.pass}');
          setState(() {
            if (A.pass == _passwordController.text) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeAdmin()));
            } else {
              String title = "wrong information password";
              String message = "Please fill out the correct information.";
              _dialogSing2(title, message);
            }
          });
        }
      });
    });
  }

  void _dialogSing1(title, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.deepOrange[400],
                size: 48.0,
              ),
              title: Text(title,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.red[400])),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void _dialogSing2(title, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.deepOrange[400],
                size: 48.0,
              ),
              title: Text(title,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.red[400])),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
