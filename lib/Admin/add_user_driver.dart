import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:may/HOME/EXTEN_WALLET/credit_card_page.dart';

class DrivingUser extends StatefulWidget {
  const DrivingUser({Key? key}) : super(key: key);

  @override
  _DrivingUserState createState() => _DrivingUserState();
}

class _DrivingUserState extends State<DrivingUser> {
   int _value = 0;
   late String _gender;
   late String DATETIMEDRIVER;
   final _formKey = GlobalKey<FormState>();
   var _DriverID = TextEditingController();
   var _driver_name = TextEditingController();
   var _driver_Surname = TextEditingController();
   var _Telephone = TextEditingController();
   var _id_card = TextEditingController();
   var _religion = TextEditingController();
   var _age = TextEditingController();
   var _driver_Email = TextEditingController();
   var _License_driver = TextEditingController();
   var _car_registration = TextEditingController();
   var _dwelling = TextEditingController();
   var _driver_user = TextEditingController();
   var _pass_driver = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(title: Text("Add driver history"),),
        body: SingleChildScrollView(

    child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
              Container(
                      height: 70,
                      width: 70,
                      child: Center(
                          child: new Image(
                              image: new AssetImage("image/van.gif")))),
                  Container(
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: 10,left: 30,right: 20),
                         child: Row(
                           children: [
                             Container(
                               child: Text("ID Driver",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(top:5,left: 20,right: 20),
                         child: TextFormField(
                           validator: (value) {
                             setState(() {});
                             if (value == null || value.isEmpty) {
                               return 'Please Fill ID Card in Blank';
                             } else {
                               return null;
                             }
                           },
                           controller: _DriverID,
                           autofocus: false,
                           style: TextStyle(fontSize: 15.0, color: Colors.black),
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             hintText: 'DST_####-####',
                             filled: true,
                             fillColor: Colors.white,
                             contentPadding: const EdgeInsets.only(
                                 left: 14.0, bottom: 6.0, top: 8.0),
                             focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.red),
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             enabledBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: Colors.white),
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("Driver Name",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 20,right: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _driver_name,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Name',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 10,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _driver_Surname,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Surname',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("Telephone Number",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:5,left: 20,right: 20),
                          child: TextFormField(
                            validator: (value) {
                              setState(() {});
                              if (value == null || value.isEmpty) {
                                return 'Please Fill ID Card in Blank';
                              } else {
                                return null;
                              }
                            },
                            controller: _Telephone,
                            autofocus: false,
                            style: TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Number',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(right: 30, left: 30),
                    child: Row(
                      children: [
                        Text("Gender",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  Row(
                    children: [
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
                              activeColor: Colors.blue,
                              toggleable: true,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20, left: 0),
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
                              activeColor: Colors.blue,
                              toggleable: true,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top:5,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("Identification Card",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:5,left: 20,right: 20),
                          child: TextFormField(
                            validator: (value) {
                              setState(() {});
                              if (value == null || value.isEmpty) {
                                return 'Please Fill ID Card in Blank';
                              } else {
                                return null;
                              }
                            },
                            controller:_id_card,
                            autofocus: false,
                            style: TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ID Card',
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                       Row(
                         children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top:20,left: 30,right: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text("Religion",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                                          ),
                                        ],
                                      ),
                                    ),
                                Padding(
                                      padding: EdgeInsets.only(top:5,left: 20,right: 10),
                                      child: TextFormField(
                                        validator: (value) {
                                          setState(() {});
                                          if (value == null || value.isEmpty) {
                                            return 'Please Fill ID Card in Blank';
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller:_religion,
                                        autofocus: false,
                                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Religion',
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: const EdgeInsets.only(
                                              left: 14.0, bottom: 6.0, top: 8.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              )),
                          Expanded(
                               child: Column(
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(top:20,left: 30,right: 20),
                                     child: Row(
                                       children: [
                                         Container(
                                           child: Text("Aeg",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                                         ),
                                       ],
                                     ),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(top:5,left: 10,right: 20),
                                     child: TextFormField(
                                       validator: (value) {
                                         setState(() {});
                                         if (value == null || value.isEmpty) {
                                           return 'Please Fill ID Card in Blank';
                                         } else {
                                           return null;
                                         }
                                       },
                                       controller:_age,
                                       autofocus: false,
                                       style: TextStyle(fontSize: 15.0, color: Colors.black),
                                       decoration: InputDecoration(
                                         border: InputBorder.none,
                                         hintText: 'Aeg',
                                         filled: true,
                                         fillColor: Colors.white,
                                         contentPadding: const EdgeInsets.only(
                                             left: 14.0, bottom: 6.0, top: 8.0),
                                         focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(color: Colors.red),
                                           borderRadius: BorderRadius.circular(10.0),
                                         ),
                                         enabledBorder: UnderlineInputBorder(
                                           borderSide: BorderSide(color: Colors.white),
                                           borderRadius: BorderRadius.circular(10.0),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ))
                         ],
                       )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("Email",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 20,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _driver_Email,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email.Com',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("License",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 20,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _License_driver,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'License Number',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("Car Registration",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 20,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _car_registration,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Car Registration Number',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("Dwelling",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 20,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _dwelling,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Dwelling',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 30,right: 20),
                          child: Row(
                            children: [
                              Container(
                                child: Text("User And Password Login Driver ",style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 20,right: 10),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _driver_user,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'DST001_surinTour@gmail.com',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top:5,left: 10,right: 20),
                                child: TextFormField(
                                  validator: (value) {
                                    setState(() {});
                                    if (value == null || value.isEmpty) {
                                      return 'Please Fill ID Card in Blank';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _pass_driver,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'DST001_surin_tour',
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 6.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _WidgetBottonDriver()
                ]
    )))
        )));
  }
  Widget _WidgetBottonDriver() {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding:
              EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  "Increase",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    mainGender();
                    print(_DriverID.text);
                    print(_driver_name.text);
                    print(_driver_Surname.text);
                    print(_Telephone.text);
                    print(_gender);
                    print(_id_card.text);
                    print(_religion.text);
                    print(_age.text);
                    print(_License_driver .text);
                    print(_dwelling.text);
                    print(_car_registration.text);
                    print(_driver_Email.text);
                    print(_driver_user.text);
                    print(_pass_driver.text);
                    saveDataDriver();
                  }
                },
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void mainGender() {
    switch (_value) {
      case 1:
        {
          _gender = "Mail";
          print('$_gender');
        }
        break;

      case 2:
        {
          _gender = "Female";
          print('$_gender');
        }
        break;
      default:
        {}
        break;
    }
  }
  void saveDataDriver()async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final data = await Firebase.initializeApp().then((value) async {
      DateTime datetime = DateTime.now();
      DATETIMEDRIVER = datetime.toString();
      print("Time $DATETIMEDRIVER");
      String myDateTime = DATETIMEDRIVER.substring(0, 19);
      print(myDateTime);
      Map<String, dynamic> map = Map();
      map['DriverID'] =_DriverID.text;
      map['time_driver'] = myDateTime;
      map['driver_name'] =_driver_name.text;
      map['driver_Surname'] =_driver_Surname.text;
      map['Telephone'] =_Telephone.text;
      map['gender'] =_gender;
      map['id_card'] =_id_card.text;
      map['religion'] =_religion.text;
      map['age'] =_age.text;
      map['License_driver'] =_License_driver.text;
      map['dwelling'] =_dwelling.text;
      map['car_registration'] =_car_registration.text;
      map['driver_Email'] =_driver_Email.text;
      map['driver_user'] =_driver_user.text;
      map['pass_driver'] =_pass_driver.text;
      await firebaseFirestore
          .collection("Driver_history")
          .doc(_DriverID.text)
          .collection("History")
          .doc()
          .set(map)
          .then((value) {
        DriverUserLogin();
      });
    });
  }
  void  DriverUserLogin()async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final data = await Firebase.initializeApp().then((value) async {
      DateTime datetime = DateTime.now();
      DATETIMEDRIVER = datetime.toString();
      print("Time $DATETIMEDRIVER");
      String myDateTime = DATETIMEDRIVER.substring(0, 19);
      print(myDateTime);
      Map<String, dynamic> map = Map();
      map['DriverID'] =_DriverID.text;
      map['time_driver'] = myDateTime;
      map['driver_name'] =_driver_name.text;
      map['driver_Surname'] =_driver_Surname.text;
      map['driver_user'] =_driver_user.text;
      map['pass_driver'] =_pass_driver.text;
      await firebaseFirestore
          .collection("DriverLogin")
          .doc(_DriverID.text)
          .set(map)
          .then((value) {
        print("***************************************************************");
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> DrivingUser()));
      });
    });
  }
}