import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:omise_flutter/omise_flutter.dart';
import 'package:http/http.dart' as http;
import '../../MODAL_DATA/get_amoung_fribase.dart';

class creditCard extends StatefulWidget {
  const creditCard({Key? key}) : super(key: key);

  @override
  _creditCardState createState() => _creditCardState();
}

class _creditCardState extends State<creditCard> {
  late String DATETIME;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? _nameController,
      _surnameController,
      _idCard,
      expiryDateMouth,
      subexpiryDateYear,
      subexpiryDateMouth,
      cvc,
      amount,
      SUB;
  String amountzero = "00";
  bool showFront = false;

  MaskTextInputFormatter idCardMask =
      MaskTextInputFormatter(mask: '#### - #### - #### - ####');
  MaskTextInputFormatter expiryDateMask =
      MaskTextInputFormatter(mask: '## / ##');
  MaskTextInputFormatter cvcMask = MaskTextInputFormatter(mask: '###');

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("บัตรเคดิส"),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CreditCard(
                        cardNumber: _idCard,
                        cardExpiry: expiryDateMouth,
                        cardHolderName: _nameController,
                        cvv: "XXX",
                        bankName: "Card Surin Tour",
                        cardType: CardType
                            .masterCard, // Optional if you want to override Card Type
                        showBackSide: showFront,
                        frontBackground: CardBackgrounds.black,
                        backBackground: CardBackgrounds.white,
                        showShadow: true,
                        textExpDate: 'Exp. Date',
                        textName: 'Name',
                        textExpiry: 'MM/YY'),
                    buildHeightSizebox(20),
                    _widgetTetxName(context),
                    buildHeightSizebox(20),
                    _widgetTetxidCard(context),
                    buildHeightSizebox(20),
                    Row(
                      children: [
                        Expanded(
                          child: _widgetexpiryDateMouth(context),
                        ),
                        Expanded(
                          child: _widgetCVCMask(context),
                        )
                      ],
                    ),
                    // _widgetexpiryDateMouth(context),
                    // buildHeightSizebox(20),
                    // _widgetCVCMask(context),
                    buildHeightSizebox(20),
                    _widgetAmount(context),
                    buildHeightSizebox(20),
                    _widgetBotton(),
                    buildHeightSizebox(20),
                  ],
                ),
              ),
            ),
          )),
    );
  }
  SizedBox buildHeightSizebox(double height) => SizedBox(
        height: height,
      );
  SizedBox buildWidthSizebox(double width) => SizedBox(
        width: width,
      );
  Widget _widgetTetxName(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
          setState(() {
            showFront = false;
          });
          if (value == null || value.isEmpty) {
            return 'Please Fill ID Card in Blank';
          } else {
            return null;
          }
        },
        onChanged: (String string) {
          _nameController = string.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          // icon: Icon(
          //   Icons.emoji_food_beverage,
          //   color: Colors.black,
          // ),
          labelText: 'Name',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _widgetTetxSurname(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
          setState(() {
            showFront = false;
          });
          if (value == null || value.isEmpty) {
            return 'Please Fill ID Card in Blank';
          } else {
            return null;
          }
        },
        onChanged: (String string) {
          _surnameController = string.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          // icon: Icon(
          //   Icons.emoji_food_beverage,
          //   color: Colors.black,
          // ),
          labelText: 'Surname',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _widgetTetxidCard(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
          setState(() {
            showFront = false;
          });
          if (value == null || value.isEmpty) {
            return 'Please Fill ID Card in Blank';
          } else {
            if (_idCard!.length != 16) {
              return 'ID Card ต้องมี 16 ตัวอักษร คะ';
            } else {
              return null;
            }
          }
        },
        inputFormatters: [idCardMask],
        onChanged: (String string) {
          _idCard = string.trim();
          _idCard = idCardMask.getUnmaskedText();
        },
        cursorColor: Theme.of(context).cursorColor,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          // icon: Icon(
          //   Icons.emoji_food_beverage,
          //   color: Colors.black,
          // ),
          labelText: 'ID Card',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _widgetexpiryDateMouth(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 5),
      child: TextFormField(
        validator: (value) {
          setState(() {
            showFront = false;
          });
          if (value == null || value.isEmpty) {
            return 'Please Fill ID Card in Blank';
          } else {
            if (expiryDateMouth!.length != 4) {
              return 'ID Card ต้องมี 4 ตัวอักษร คะ';
            } else {
              return null;
            }
          }
        },
        inputFormatters: [expiryDateMask],
        onChanged: (String string) {
          //_idCard = string.trim();
          expiryDateMouth = expiryDateMask.getUnmaskedText();
        },
        cursorColor: Theme.of(context).cursorColor,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          labelText: 'Expiry Date',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _widgetCVCMask(context) {
    return GestureDetector(
      //onTap: (){showFront = true;},
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 50),
        child: TextFormField(
          validator: (value) {
            setState(() {});
            if (value == null || value.isEmpty) {
              return 'Please Fill ID Card in Blank';
            } else {
              if (cvc!.length != 3) {
                return 'ID Card ต้องมี 3 ตัวอักษร คะ';
              } else {
                return null;
              }
            }
          },
          inputFormatters: [cvcMask],
          onChanged: (String string) {
            //_idCard = string.trim();
            cvc = cvcMask.getUnmaskedText();
          },
          cursorColor: Theme.of(context).cursorColor,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
            // icon: Icon(
            //   Icons.emoji_food_beverage,
            //   color: Colors.black,
            // ),
            labelText: 'CVC',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
  Widget _widgetAmount(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
          setState(() {
            showFront = false;
          });
          if (value == null || value.isEmpty) {
            return 'Please Fill ID Card in Blank';
          } else {
            return null;
          }
        },
        onChanged: (String string) {
          amount = string.trim();
        },
        cursorColor: Theme.of(context).cursorColor,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange, width: 2.0)),
          // icon: Icon(
          //   Icons.emoji_food_beverage,
          //   color: Colors.black,
          // ),
          labelText: 'Amount',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _widgetBotton() {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 50, right: 50),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  "Paid",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                   //getTokenAndChargeOmise();
                   AddAmountToFribase();
                    //GetAmountFri();
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
  Future<void> getTokenAndChargeOmise() async {
    //+++++++++++++++++++++++++++++++++++++++++++
    // print("$expiryDateMouth");
    SUB = expiryDateMouth;
    subexpiryDateMouth = SUB!.substring(0, 2);
    String subexpiryDateMouthString1 = "01";
    String A1 = "1";
    if (subexpiryDateMouth == subexpiryDateMouthString1) {
      subexpiryDateMouth = A1;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString2 = "02";
    String A2 = "2";
    if (subexpiryDateMouth == subexpiryDateMouthString2) {
      subexpiryDateMouth = A2;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString3 = "03";
    String A3 = "3";
    if (subexpiryDateMouth == subexpiryDateMouthString3) {
      subexpiryDateMouth = A3;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString4 = "04";
    String A4 = "4";
    if (subexpiryDateMouth == subexpiryDateMouthString4) {
      subexpiryDateMouth = A4;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString5 = "05";
    String A5 = "5";
    if (subexpiryDateMouth == subexpiryDateMouthString5) {
      subexpiryDateMouth = A5;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString6 = "06";
    String A6 = "6";
    if (subexpiryDateMouth == subexpiryDateMouthString6) {
      subexpiryDateMouth = A6;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString7 = "07";
    String A7 = "7";
    if (subexpiryDateMouth == subexpiryDateMouthString7) {
      subexpiryDateMouth = A7;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString8 = "08";
    String A8 = "8";
    if (subexpiryDateMouth == subexpiryDateMouthString8) {
      subexpiryDateMouth = A8;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString9 = "09";
    String A9 = "9";
    if (subexpiryDateMouth == subexpiryDateMouthString9) {
      subexpiryDateMouth = A9;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString10 = "10";
    String A10 = "10";
    if (subexpiryDateMouth == subexpiryDateMouthString10) {
      subexpiryDateMouth = A10;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString11 = "11";
    String A11 = "11";
    if (subexpiryDateMouth == subexpiryDateMouthString11) {
      subexpiryDateMouth = A11;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString12 = "12";
    String A12 = "12";
    if (subexpiryDateMouth == subexpiryDateMouthString12) {
      subexpiryDateMouth = A12;
      //print("$subexpiryDateMouth");
    }

    var NOT12 = int.parse('13');
    var subNOT = int.parse(subexpiryDateMouth!);
    String A00 = "0";
    if (subNOT >= NOT12) {
      subexpiryDateMouth = A00;
      print("$A00");
    }
    subexpiryDateYear = SUB!.substring(2, 4);
    //+++++++++++++++++++++++++++++++++++++++++++
    getTokenOMISE();
  }
  Future<void> getTokenOMISE() async {
    String PUBLICKEY = 'pkey_test_5pbs2hopunn8gf11dk3';
    OmiseFlutter omiseFlutter = OmiseFlutter("$PUBLICKEY");
    await omiseFlutter.token
        .create("$_nameController", "$_idCard", "$subexpiryDateMouth",
            "$subexpiryDateYear", "$cvc")
        .then((value) async {
      String token = value.id.toString();
      print("tokenOmise==" + "$token");

      String secreKey = "skey_test_5pbs2hopu0zmtbve1bk";
      String urlAPI = 'https://api.omise.co/charges';
      String basicAuth = 'Basic ' + base64Encode(utf8.encode(secreKey + ":"));

      Map<String, String> headerMap = {};
      headerMap['authorization'] = basicAuth;
      headerMap['Cache-Control'] = 'no-cache';
      headerMap['Content-Type'] = 'application/x-www-form-urlencoded';

      String amuntzerotest = "$amount" + "$amountzero";
      print("$amuntzerotest");

      Map<String, dynamic> data = {};
      data['amount'] = amuntzerotest;
      data['currency'] = 'thb';
      data['card'] = token;

      Uri uri = Uri.parse(urlAPI);
      http.Response response = await http.post(
        uri,
        headers: headerMap,
        body: data,
      );
      var resultCharge = json.decode(response.body);
      print('status ${resultCharge['status'].toString()}');
      AddAmountToFribase();

    }).catchError((value) {
      print("NotOK");
      String TokenOmiseErrorTitle = value.code;
      String TokenOmiseErrorMassage = value.message;
      showAlert2('$TokenOmiseErrorTitle', '$TokenOmiseErrorMassage');
    });
  }
  Future<void> AddAmountToFribase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final data = await Firebase.initializeApp().then((value) async {

      DateTime datetime = DateTime.now();
      DATETIME = datetime.toString();
      print("Time $DATETIME");
      String myDateTime = DATETIME.substring(0,19);
      print(myDateTime);

      final User? user = auth.currentUser;
      final Uid = user?.uid;
      print("Uid $Uid");
      Map<String, dynamic> map = Map();
      map['name']=_nameController;
      map['amount'] = amount;
      map['time'] = myDateTime;
      //_time.substring(0,10);
      print(amount);
      await firebaseFirestore
      .collection("WalletUserOMISE")
      .doc(Uid)
      .collection("AMOUNTOMISE")
      .doc()
      .set(map)
      .then((value){
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  totalWallet()));
      });
    });
  }
  Future<void> showAlert2(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.red[800]),
                  ))
            ],
          );
        });
  }
  //
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
}
