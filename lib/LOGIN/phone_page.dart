import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may/HOME/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  String _stringZero = "+66";
  final _codeController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
            backgroundColor: Colors.blueAccent[400],
            title: Text(
              " Singin phone ",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      child: new Image(image: new AssetImage("image/van.gif"))),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Singin phone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text("+66 ")),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.center,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    String title = "Can't make the transaction";
                                    String message =
                                        "Please fill out the information correctly and completely.";
                                    _dialog(title, message);
                                  } else {
                                    final phone = _stringZero.toString() +
                                        _phoneController.text.trim();
                                    print(_stringZero.toString() +
                                        _phoneController.text.trim());
                                    print(phone);
                                    loginPhone(phone, context);
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Phone Number"),
                                controller: _phoneController,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 70, right: 70),
                    width: double.infinity,
                    child: FlatButton(
                      child: Text("SINGIN"),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future loginPhone(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        Navigator.of(context).pop();
        UserCredential result = await _auth.signInWithCredential(credential);
        User? IDuser = result.user;
        if (IDuser != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          print("Error");
        }
        // การส่งค่ากลับนี้จะถูกเรียกเมื่อทำการยืนยันโดยอัตโนมัติ maticlly
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception);
      },
      codeSent: (String verificationId, int? resendToken) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("*OTP"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Please enter *OTP* from SMS"),
                    SizedBox(),
                    Container(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        controller: _codeController,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  SizedBox(width: 10,),
                  FlatButton(
                    child: Container(
                        color: Colors.red[800],
                        height: 35,
                        width: 100,
                        child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ))),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Container(
                        color: Colors.green[800],
                        height: 35,
                        width: 100,
                        child: Center(
                            child: Text(
                          "Confirm",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ))),
                    // textColor: Colors.white,
                    // color: Colors.blue,
                    onPressed: () async {
                      final code = _codeController.text.trim();
                      AuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: code);
                      UserCredential result =
                          await _auth.signInWithCredential(credential);
                      User? IDuser = result.user;
                      if (IDuser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        print("Error");
                      }
                    },
                  ),
                  SizedBox(width: 10,),
                ],
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _dialog(title, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.deepOrange[800],
                size: 40.0,
              ),
              title: Text(title,
                  style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  child: Container(
                    color: Colors.green,
                    height: 40,
                    width: 100,
                    child: Center(
                      child: Text('OK',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
