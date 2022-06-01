import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_email.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _REemailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
          title: Text(
            " Reset Password ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 0, right: 0),
            child: Form(
                key: _formKey,
                child: Card(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 70, left: 25, right: 25, bottom: 250),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: new Image(
                                      image: new AssetImage(
                                          '-'))),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.only(left: 20,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: _REemailController,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.blue, width: 2.0)),
                                    icon: Icon(Icons.email,color: Colors.blue,),
                                    labelText: 'Email :',
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 30),
                                width: A.width * 0.4,
                                child: ElevatedButton(
                                  child: Text("Reset"),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _REpass();
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
                            ])))),
          ),
        ],
      ))),
    );
  }

  void _REpass() {
    print(_REemailController.text);
    _firebaseAuth
        .sendPasswordResetEmail(email: _REemailController.text)
        .then((value) {
      _dialogOKRESET();
    }).catchError((erroe) {
      _dialogNORESET();
    });
  }

  void _dialogNORESET() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.red[400],
                size: 48.0,
              ),
              title: Container(
                  height: 30,
                  width: 200,
                  child: AutoSizeText('Failed reset password',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
            content: Container(
                height: 40,
                width: 200,
                child: Center(
                  child: AutoSizeText(
                      ' - check internet\n - Check the entered email\n - Check you have registered the app?'),
                )),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.green[400])),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void _dialogOKRESET() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.green[400],
                size: 48.0,
              ),
              title: Container(
                  height: 30,
                  width: 200,
                  child: AutoSizeText('Successfully reset password',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
            content: Container(
                height: 30,
                width: 200,
                child: Center(
                  child: AutoSizeText(
                      'We send a link to change password\n to Your email is complete.'),
                )),
            actions: <Widget>[
              FlatButton(
                  child: Text('OK',
                      style: TextStyle(fontSize: 16, color: Colors.green[400])),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(builder: (context) => LoninEmail()),
                    );
                  })
            ],
          );
        });
  }
}
