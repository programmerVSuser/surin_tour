import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may/HOME/home_page.dart';
import 'package:may/LOGIN/reset_password.dart';

class LoninEmail extends StatefulWidget {
  const LoninEmail({Key? key}) : super(key: key);

  @override
  _LoninEmailState createState() => _LoninEmailState();
}

class _LoninEmailState extends State<LoninEmail> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size A = MediaQuery
        .of(context)
        .size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
          title: Text(
            " Login Email ",
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
                  padding: EdgeInsets.only(left: 50,right: 50),
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
                      icon: Icon(Icons.email,color: Colors.blue,),
                      labelText: 'Email :',
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20,left: 50,right: 50),
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
                      icon: Icon(Icons.lock,color: Colors.blue,),
                      labelText: 'Password :',
                      labelStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: Column(children: [
                    TextButton(
                      child: Text(
                        'Reset Password',
                        style: TextStyle(color: Colors.red,fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.teal,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  width: A.width * 0.4,
                  child: ElevatedButton(
                    child: Text("Login"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _signInWithEmailAndPassword2();
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
    );
  }
  Future<void>_signInWithEmailAndPassword2()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ).then((response)async{
      print(_auth.currentUser!.uid);
      var UID = _auth.currentUser!.uid;
      MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic>route) => false);
    }).catchError((response){
      String title = response.code;
      String message = response.message;
      _dialogSingEmail(title, message);
    });
  }
  void _dialogSingEmail(title, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.highlight_remove_sharp,
                color: Colors.deepOrange[400],
                size: 40.0,
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
