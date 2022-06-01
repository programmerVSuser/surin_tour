import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:may/HOME/home_page.dart';
import 'package:may/LOGIN/google_sing_in.dart';
import 'package:may/LOGIN/login_email.dart';
import 'package:may/LOGIN/phone_page.dart';
import 'package:may/REGISTER/register_email_page.dart';

class HomeMenuAccount extends StatefulWidget {
  const HomeMenuAccount({Key? key}) : super(key: key);

  @override
  _HomeMenuAccountState createState() => _HomeMenuAccountState();
}

class _HomeMenuAccountState extends State<HomeMenuAccount> {
 //FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 30),
                            child: Expanded(
                              child: Column(children: <Widget>[
                                SizedBox(
                                  height: 80,
                                ),
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: new Image(image: new AssetImage("image/van.gif"))),
                              ]),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  'SURIN TOUR',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 20)),
                          Container(
                            width: size.width * 0.7,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize:
                                    MaterialStateProperty.all(Size(300, 35)),
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                            side: BorderSide(
                                                color: Colors.blue))),
                                  ),
                                  child: new Text(
                                    "Login Email",
                                    style: TextStyle(color: Colors.blue[600]),
                                  ),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoninEmail()),
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            width: size.width * 0.7,
                            child: ElevatedButton(
                              child: Text("Register Email"),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterEmail()),
                                ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent[600],
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(child: Text("OR"),),
                          SizedBox(height: 15,),
                          Container(
                            height: 50,
                            width: size.width * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: size.width * 0.3,
                                  child: ElevatedButton(
                                    child: Text("Singin Phone",style: TextStyle(fontSize: 12)),
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueAccent[400],
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 40,
                                  width: size.width * 0.3,
                                  child: ElevatedButton(
                                    child: Text("Singin Google",style: TextStyle(fontSize: 12),),
                                    onPressed: () {
                                      AuthClass()
                                          .signWithGoogleTEST()
                                          .then((UserCredential value) {
                                        final displayName = value.user?.displayName;
                                        print("test $displayName");

                                        MaterialPageRoute materialPageRoute =
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeScreen());
                                        Navigator.of(context).pushAndRemoveUntil(
                                            materialPageRoute,
                                                (Route<dynamic> route) => false);
                                      }).catchError((response) {
                                        String title = "can't register";
                                        String message = "Please check your internet.";
                                        _dialogSinngin(title, message);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueAccent[400],
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]
                      ),
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
  void _dialogSinngin(title, message) {
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
