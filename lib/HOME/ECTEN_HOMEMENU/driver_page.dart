import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class driver extends StatefulWidget {
  const driver({Key? key}) : super(key: key);

  @override

  _driverState createState() => _driverState();
}
class _driverState extends State<driver> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size SIZE = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(title: Text("Login Driver"),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Center(
              child: Column(
                children:<Widget> [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      child: new Image(
                          image:
                          new AssetImage('image/van.gif'))
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 350,
                    height: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.pink[200],
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: const ListTile(
                              leading: Icon(Icons.account_circle_outlined, size: 50,color: Colors.white),

                              title: Text('DRIVER LOGIN', style: TextStyle(color: Colors.white,fontSize: 20)),
                              subtitle: Text('Only Trainers and Leaders',
                                  style: TextStyle(color: Colors.white,fontSize: 12)),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: new InputDecoration(
                                    errorStyle: TextStyle(fontSize: 10.0),
                                    labelText: 'Email :',
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(15.0),
                                      borderSide: new BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(
                                          color: Colors.white,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0))),
                                style: new TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value!.isEmpty|| _emailController == null) {
                                    return '\u26A0  Field is empty.';
                                  }
                                  return null;
                                },
                              )),
                          Container(
                              padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: new InputDecoration(
                                    errorStyle: TextStyle(fontSize: 10.0),
                                    labelText: 'Password :',
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(15.0),
                                      borderSide: new BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(15.0),
                                        borderSide: new BorderSide(
                                          color: Colors.white,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: new BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0))),
                                style: new TextStyle(color: Colors.black),
                                validator: (value) {
                                  if (value!.isEmpty || _passwordController == null) {
                                    return '\u26A0  Field is empty.';
                                  }
                                  return null;
                                },
                              )),
                          Container(
                            height: 55,
                            width: 200,
                            padding: EdgeInsets.only(top: 20,),
                            child: ElevatedButton(
                              child: Text("Sign in"),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  //_signInWithEmailAndPassword2();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange[600],
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
