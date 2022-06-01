import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../HOME_ACCOUNT/home_menu_account.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeMenuAccount()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size B = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
          body : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //padding: EdgeInsets.only(top: 200),
                  width: B.width * 0.8,
                  child: Expanded(
                    child: Column(children: <Widget>[
                      Container(
                          height: 100,
                          width: 100,
                          child: new Image(
                              image:
                              new AssetImage('image/van.gif'))),
                      SizedBox(height: 10,),
                      Text(
                        "SURIN TOUR",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                        //style: TextStyle(fontSize: 18),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}