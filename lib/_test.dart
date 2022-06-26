import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MODAL_DATA/get_amoung_fribase.dart';
FirebaseAuth auth = FirebaseAuth.instance;
//
//
// Future<void>AddDOCS()async{
//   final User? user = auth.currentUser;
//   final Uid = user?.uid;
//   print("Uid $Uid");
//   final data = await Firebase.initializeApp().then((value) async {
//     String AmountOmi='';
//     Map<String, dynamic> map = Map();
//     map['Amount'] = AmountOmi;
//     await FirebaseFirestore.instance
//         .collection('WalletUser')
//         .doc(Uid)
//         .collection("AMOUNT")
//         .doc(Uid)
//         .set(map).then((value){
//
//     });
//   });
// }
// Future<void> GetAmountFri() async {
//   final User? user = auth.currentUser;
//   final Uid = user?.uid;
//   print("Uid $Uid");
//   final data = await Firebase.initializeApp().then((value) async {
//     await FirebaseFirestore.instance
//         .collection('WalletUser')
//         .doc(Uid)
//         .collection('AMOUNT')
//         .snapshots()
//         .listen((event) {
//       int indexs = 0;
//       for (var snap in event.docs) {
//         Map<String, dynamic> map = snap.data();
//         print('map = ${map}');
//         GetAmountFribase modal = GetAmountFribase.fromMap(map);
//         productModals.add(modal);
//         String amountWallet = modal.Amount;
//         indexs++;
//         print(amountWallet);
//         print("indexs_DACS=$indexs");
//         String ZERO = "0";
//         if(amountWallet == ZERO){
//           //AddAmountToFribase();
//           print("NULL");
//
//         }else{
//           print("NOT NULL");
//         }
//       }
//     });
//   });
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class DrivingUser extends StatefulWidget {
//   const DrivingUser({Key? key}) : super(key: key);
//
//   @override
//   _DrivingUserState createState() => _DrivingUserState();
// }
//
// class _DrivingUserState extends State<DrivingUser> {
//    String? driver_name;
//    String? Telephone;
//    String? Age;
//    String? driverID;
//    String? driver_Email;
//    String? License_driver;
//    String? car_registration;
//    String? _driver_user;
//    String? _pass_driver;
//    String?_dwelling;
//    String? _adjunct;
//
//   int _value = 0;
//   late String _gender;
//   late String DATETIMEDRIVER;
//   var formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           title: Text("Add driver history"),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   Container(
//                       height: 80,
//                       width: 80,
//                       child: Center(
//                           child: new Image(
//                               image: new AssetImage("image/van.gif")))),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                       child: TextFormField(
//                         validator: (value) {
//                           setState(() {
//                           });
//                           if (value == null || value.isEmpty) {
//                             return 'Please Fill ID Card in Blank';
//                           } else {
//                             return null;
//                           }
//                         },
//                         onChanged: (String string) {
//                           driverID = string.trim();
//                         },
//                         cursorColor: Theme.of(context).cursorColor,
//                         decoration: InputDecoration(
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                           labelText: 'Driver ID',
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelStyle: TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         driver_name = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Name And Surname',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                             margin:
//                                 EdgeInsets.only(left: 20, right: 5, top: 20),
//                           child: TextFormField(
//                             validator: (value) {
//                               setState(() {
//                               });
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Fill ID Card in Blank';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (String string) {
//                               Telephone = string.trim();
//                             },
//                             cursorColor: Theme.of(context).cursorColor,
//                             decoration: InputDecoration(
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                               labelText: 'Telephone',
//                               filled: true,
//                               fillColor: Colors.white,
//                               labelStyle: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),),
//                       ),
//                       Expanded(
//                         child: Container(
//                             margin:
//                                 EdgeInsets.only(left: 5, right: 20, top: 20),
//                             child: TextFormField(
//                             validator: (value) {
//                       setState(() {
//                       });
//                       if (value == null || value.isEmpty) {
//                       return 'Please Fill ID Card in Blank';
//                       } else {
//                       return null;
//                       }
//                       },
//                         onChanged: (String string) {
//                           Age = string.trim();
//                         },
//                         cursorColor: Theme.of(context).cursorColor,
//                         decoration: InputDecoration(
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                           labelText: 'Age',
//                           filled: true,
//                           fillColor: Colors.white,
//                           labelStyle: TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),),
//                       ),
//                     ],
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         _dwelling = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Dwelling',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 30, top: 20),
//                         child: Text(
//                           "Gender",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(right: 20, left: 20),
//                         child: Row(
//                           children: [
//                             Radio(
//                               value: 1,
//                               groupValue: _value,
//                               onChanged: (Value) {
//                                 setState(() {
//                                   _value = Value as int;
//                                   print("$_value");
//                                 });
//                               },
//                               activeColor: Colors.blue,
//                               toggleable: true,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               "Male",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(right: 20, left: 0),
//                         child: Row(
//                           children: [
//                             Radio(
//                               value: 2,
//                               groupValue: _value,
//                               onChanged: (Value) {
//                                 setState(() {
//                                   _value = Value as int;
//                                   print("$_value");
//                                 });
//                               },
//                               activeColor: Colors.blue,
//                               toggleable: true,
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               "Female",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         driver_Email = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Email',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         License_driver = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'License',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         car_registration = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Car Registration',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 30, top: 20),
//                         child: Text(
//                           "User And Password",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         _driver_user = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Email@SurinTour.com',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         _pass_driver = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Password',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   Container(
//                       margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                     child: TextFormField(
//                       validator: (value) {
//                         setState(() {
//                         });
//                         if (value == null || value.isEmpty) {
//                           return 'Please Fill ID Card in Blank';
//                         } else {
//                           return null;
//                         }
//                       },
//                       onChanged: (String string) {
//                         _adjunct = string.trim();
//                       },
//                       cursorColor: Theme.of(context).cursorColor,
//                       decoration: InputDecoration(
//                         focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
//                         labelText: 'Adjunct',
//                         filled: true,
//                         fillColor: Colors.white,
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),
//                   _WidgetBottonDriver()
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void mainGender() {
//     switch (_value) {
//       case 1:
//         {
//           _gender = "Mail";
//           print('$_gender');
//         }
//         break;
//
//       case 2:
//         {
//           _gender = "Female";
//           print('$_gender');
//         }
//         break;
//       default:
//         {}
//         break;
//     }
//   }
//
//   Widget _WidgetBottonDriver() {
//     return Container(
//       child: Center(
//         child: Column(
//           children: [
//             Container(
//               padding:
//                   EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
//               width: double.infinity,
//               child: FlatButton(
//                 child: Text(
//                   "Increase",
//                   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
//                 ),
//                 textColor: Colors.white,
//                 padding: EdgeInsets.all(12),
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     print("$driverID");
//                     print("$_gender");
//                     print("$driver_name");
//                     print("$Telephone");
//                     print("$driverID");
//                     print(" $Age");
//                     print("$driver_Email");
//                     print("$License_driver");
//                     print(" $car_registration");
//                     print("$_driver_user");
//                     print("$_pass_driver");
//                     print(" $_dwelling");
//                     print("$_adjunct");
//                     //AddDataDriver();
//                   }
//                 },
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void AddDataDriver() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     final data = await Firebase.initializeApp().then((value) async {
//       DateTime datetime = DateTime.now();
//       DATETIMEDRIVER = datetime.toString();
//       print("Time $DATETIMEDRIVER");
//       String myDateTime = DATETIMEDRIVER.substring(0, 19);
//       print(myDateTime);
//
//       Map<String, dynamic> map = Map();
//       // map['time_driver'] = myDateTime.toString();
//       // map['driver_name'] = driver_name.toString();
//          map['id_drive'] = driverID;
//       // map['email'] = driver_Email.toString();
//       // map['telephone_number'] = Telephone.toString();
//       // map['age'] = Age.toString();
//       // map['driving_license_no'] = License_driver.toString();
//       // map['car_registration'] = car_registration.toString();
//       // map['driver_user'] = _driver_user.toString();
//       // map['pass_driver'] = _pass_driver.toString();
//       // map['adjunct'] = _adjunct.toString();
//       // map['dwelling'] = _dwelling.toString();
//       // map['gender'] = _gender;
//       await firebaseFirestore
//           .collection("Driver_history")
//           .doc(driverID)
//           .set(map)
//           .then((value) {
//         DriverUserLogin();
//       });
//     });
//   }
//
//   void DriverUserLogin() async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     final data = await Firebase.initializeApp().then((value) async {
//       DateTime datetime = DateTime.now();
//       DATETIMEDRIVER = datetime.toString();
//       print("Time $DATETIMEDRIVER");
//       String myDateTime = DATETIMEDRIVER.substring(0, 19);
//       print(myDateTime);
//       Map<String, dynamic> map = Map();
//       map['id_drive'] = driverID.toString();
//       // map['time_driver'] = myDateTime.toString();
//       // map['driver_name'] = driver_name.toString();
//       // map['driver_user'] = _driver_user.toString();
//       // map['pass_driver'] = _pass_driver.toString();
//       await firebaseFirestore
//           .collection("DriverLogin")
//           .doc(driverID)
//           .set(map)
//           .then((value) {
//         print("ADDOKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
//       });
//     });
//   }
// }
