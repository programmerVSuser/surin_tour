import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may/LOGIN/login_email.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _OTP = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register Email'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Form(
                key: _formKey,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 50, left: 50, right: 50, bottom: 250),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 100,
                            width: 100,
                            child: new Image(
                                image:
                                    new AssetImage('image/van.gif'))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
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
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              icon: Icon(Icons.email),
                              labelText: 'Email :',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 2.0)),
                              icon: Icon(Icons.lock),
                              labelText: 'Password :',
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: A.width * 0.4,
                          child: ElevatedButton(
                            child: Text("Next"),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _showDialogOTP();
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
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  void _showDialogOTP() async {
    Size A = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Center(
              child: AlertDialog(
                title: ListTile(
                  leading: Icon(
                    Icons.add_moderator,
                    color: Colors.green[400],
                    size: 30.0,
                  ),
                  title: Container(
                      padding: EdgeInsets.only(right: 50),
                      height: 20,
                      width: 50,
                      child: Column(
                        children: [
                          Container(
                            child: Expanded(
                              child: Center(
                                child: AutoSizeText('OTP from email',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                content: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40, right: 10),
                              height: 20,
                              width: 150,
                              child: Container(
                                child: TextFormField(
                                  controller: _OTP,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    labelStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                ),
                              ),
                            ),
                            Container(
                                child: TextButton(
                              child: Text(
                                'SEND OTP',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.teal,
                              ),
                              onPressed: () {
                                sendOTP();
                              },
                            )),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Container(
                        //color: Colors.grey[100],
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: A.width * 4,
                                child: ElevatedButton(
                                  child: Text("Cencel"),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepOrange[600],
                                    onPrimary: Colors.white,
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
                                width: A.width * 4,
                                child: ElevatedButton(
                                  child: Text("Next"),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      verifyOTP();
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _register() async {
    FirebaseAuth _RG = FirebaseAuth.instance;
    _RG
        .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((response) {
      _dialogRegitOK();
      print('สมัคสมาชิกสำเร็จ $_emailController');
    }).catchError((response) {
      String _titel = response.code;
      String _masess = response.message;
      print('_titel=$_titel,_masess = $_masess');
      _dialogRegitBUG(_titel, _masess);
    });
  }

  void sendOTP() async {
    EmailAuth.sessionName = "SURIN TOUR OTP";
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      print("OTP SEND$res");
    } else {
      print("We could not send the OTP");
      String _titel = "OTP Wrong";
      String _masess = "We could not send the OTP";
      _dialogSrndOTP(_titel, _masess);
    }
  }

  void _dialogSrndOTP(_titel, _masess) {
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
              title: Text(_titel,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(_masess),
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

  void verifyOTP() {
    var res = EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _OTP.text);
    if (res) {
      _register();
      print("OK");
    } else {
      print("กรุณาใส่ OTP ให้ถูกต้อง");
    }
  }

  void _dialogRegitBUG(_titel, _masess) {
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
              title: Text(_titel,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(_masess),
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

  void _dialogRegitOK() {
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
                  child: AutoSizeText('Successfully registered',
                      style: TextStyle(fontSize: 20, color: Colors.black))),
            ),
            content: Container(
                height: 30,
                width: 200,
                child: Center(
                  child: AutoSizeText('Press the OK button to login.'),
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
