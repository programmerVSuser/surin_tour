import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Admin/admin_login.dart';
import '../HOME/ECTEN_HOMEMENU/driver_page.dart';
import '../LOGIN/login_email.dart';

class SelectedRadio extends StatefulWidget {
  const SelectedRadio({Key? key}) : super(key: key);

  @override
  _SelectedRadioState createState() => _SelectedRadioState();
}

class _SelectedRadioState extends State<SelectedRadio> {
  int _value = 3;
  void mainNext() {
    switch (_value) {
      case 1:
        {
          print('');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminLogin()),
          );
        }
        break;

      case 2:
        {
          print('OK2');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Driver()),
          );
        }
        break;

      case 3:
        {
          print('OK3');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoninEmail()),
          );
        }
        break;

      case 4:
        {
          print('OK4');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ),
          //);
        }
        break;
      //dialog Redio
      default:{}
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Text("เข้าสู่ระบบ"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(
                  height: 100, width: 100, child: Image.asset('image/van.gif')),
              Container(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('กรุณาเลือกสถานะของคุณ',
                      style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (Value) {
                        setState(() {
                          _value = Value as int;
                          print("$_value");
                        });
                      },
                      activeColor: Colors.green,
                      toggleable: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("ผู้ดูเเลระบบ ( Admin )",
                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (Value) {
                        setState(() {
                          _value = Value as int;
                          print("$_value");
                        });
                      },
                      activeColor: Colors.green,
                      toggleable: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("พนักงานขับรถ ( Driver )",
                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _value,
                      onChanged: (Value) {
                        setState(() {
                          _value = Value as int;
                          print("$_value");
                        });
                      },
                      activeColor: Colors.green,
                      toggleable: true,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("ผ็ูใช้งานทัวไป ( User )",
                      style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child: RaisedButton(
                  onPressed: () {
                    mainNext();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffD50000), Color(0xFFFF1744)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 350.0, minHeight: 40.0),
                      alignment: Alignment.center,
                      child: Text(
                        "ต่อไป",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
