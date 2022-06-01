import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Contact",style: TextStyle(
            color: Colors.white
          )),
          backgroundColor: Colors.yellow[800],),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(padding: EdgeInsets.only(left: 15,right: 15),
                  child: AutoSizeText("* If you encounter problems, you can contact Surin Tour via the channels below.",
                  style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              SizedBox(height: 20,),
              Container(
                  child: ScaleTransition(
                      scale: _animation,
                      alignment: Alignment.center,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 160,
                                width: 300,
                                child:Image.asset("image/MAP.jpg"),),
                            ]),
                      ))),
              SizedBox(height: 30,),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                  color: Colors.white,
              ),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Container(
                        child: Text('Contact Admin Surin Tour',
                            style: TextStyle(color:Colors.red,fontSize: 18,fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left:10,right: 10,),
                            child: Text('Facebook:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                                child: TextButton(
                                    child: Text('May Nidtaya Yooyen',
                                      style: TextStyle(fontSize: 16),),
                                    onPressed: () {
                                      _showURL1();
                                    }
                                )
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(padding: EdgeInsets.only(left:10,right: 10,top: 10),
                            child: Text(
                                'Email:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                                'nidtaya199920@gmail.com',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(padding: EdgeInsets.only(left:10,right: 10,top: 25),
                            child: Text(
                                'Phone:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                                '0937467112',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
  void _showURL1() async {
    const url = "https://web.facebook.com/profile.php?id=100005190814960";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not $url';
    }
  }
}
