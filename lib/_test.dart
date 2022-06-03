import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:omise_flutter/omise_flutter.dart';
class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? _nameController, _surnameController,
      _idCard, expiryDateMouth, subexpiryDateYear,subexpiryDateMouth,
      cvc, amount, SUB;
  MaskTextInputFormatter idCardMask = MaskTextInputFormatter(mask: '#### - #### - #### - ####');
  MaskTextInputFormatter expiryDateMask = MaskTextInputFormatter(mask: '## / ####');
  MaskTextInputFormatter cvcMask = MaskTextInputFormatter(mask: '###');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Surin Tour Wallet',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildHeightSizebox(20),
                _widgetTetxName(context),
                buildHeightSizebox(20),
                _widgetTetxSurname(context),
                buildHeightSizebox(20),
                _widgetTetxidCard(context),
                buildHeightSizebox(20),
                _widgetexpiryDateMouth(context),
                buildHeightSizebox(20),
                _widgetCVCMask(context),
                buildHeightSizebox(20),
                _widgetAmount(context),
                buildHeightSizebox(20),
                _widgetBotton()

              ],
            ),
          ),
        ),
      ),
    );
  }
  //Kasoniterjro@gmail.com
  //#Oom0621603506
  SizedBox buildHeightSizebox(double height) => SizedBox(height: height,);
  SizedBox buildWidthSizebox(double width) => SizedBox(width: width,);

  Widget _widgetTetxName(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
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
              borderSide:
              BorderSide(color: Colors.deepOrange, width: 2.0)),
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
              borderSide:
              BorderSide(color: Colors.deepOrange, width: 2.0)),
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
              borderSide:
              BorderSide(color: Colors.deepOrange, width: 2.0)),
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
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Fill ID Card in Blank';
          } else {
            if (expiryDateMouth!.length != 6) {
              return 'ID Card ต้องมี 6 ตัวอักษร คะ';
            } else {return null;}
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
              borderSide:
              BorderSide(color: Colors.deepOrange, width: 2.0)),
          labelText: 'Expiry Date',
          labelStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Widget _widgetCVCMask(context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
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
              borderSide:
              BorderSide(color: Colors.deepOrange, width: 2.0)),
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
    );
  }
  Widget _widgetAmount(context){
    return Container(
      padding: EdgeInsets.only(left: 40, right: 50),
      child: TextFormField(
        validator: (value) {
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
              borderSide:
              BorderSide(color: Colors.deepOrange, width: 2.0)),
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
            RaisedButton(
                color: Colors.white,
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    getTokenAndChargeOmise();
                  }
                },
                child: new Text(
                  "Add Wallet",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
  Future <void> getTokenAndChargeOmise() async {
    //+++++++++++++++++++++++++++++++++++++++++++
    // print("$expiryDateMouth");
    SUB = expiryDateMouth;
    subexpiryDateMouth = SUB!.substring(0, 2);
    String subexpiryDateMouthString1 = "01";
    String A1 ="1";
    if(subexpiryDateMouth == subexpiryDateMouthString1){
      subexpiryDateMouth = A1;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString2 = "02";
    String A2 ="2";
    if(subexpiryDateMouth == subexpiryDateMouthString2){
      subexpiryDateMouth = A2;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString3 = "03";
    String A3 ="3";
    if(subexpiryDateMouth == subexpiryDateMouthString3){
      subexpiryDateMouth = A3;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString4 = "04";
    String A4 ="4";
    if(subexpiryDateMouth == subexpiryDateMouthString4){
      subexpiryDateMouth = A4;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString5 = "05";
    String A5 ="5";
    if(subexpiryDateMouth == subexpiryDateMouthString5){
      subexpiryDateMouth = A5;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString6 = "06";
    String A6 ="6";
    if(subexpiryDateMouth == subexpiryDateMouthString6){
      subexpiryDateMouth = A6;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString7 = "07";
    String A7 ="7";
    if(subexpiryDateMouth == subexpiryDateMouthString7){
      subexpiryDateMouth = A7;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString8 = "08";
    String A8 ="8";
    if(subexpiryDateMouth == subexpiryDateMouthString8){
      subexpiryDateMouth = A8;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString9 = "09";
    String A9 ="9";
    if(subexpiryDateMouth == subexpiryDateMouthString9){
      subexpiryDateMouth = A9;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString10 = "10";
    String A10 ="10";
    if(subexpiryDateMouth == subexpiryDateMouthString10){
      subexpiryDateMouth = A10;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString11 = "11";
    String A11 ="11";
    if(subexpiryDateMouth == subexpiryDateMouthString11){
      subexpiryDateMouth = A11;
      //print("$subexpiryDateMouth");
    }

    String subexpiryDateMouthString12 = "12";
    String A12 ="12";
    if(subexpiryDateMouth == subexpiryDateMouthString12){
      subexpiryDateMouth = A12;
      //print("$subexpiryDateMouth");
    }

    var NOT12 = int.parse('13');
    var subNOT =int.parse(subexpiryDateMouth!);
    String A00 ="0";
    if(subNOT >= NOT12 ){
      subexpiryDateMouth = A00;
      print("$A00");
    }
    subexpiryDateYear = SUB!.substring(2, 6);
    //+++++++++++++++++++++++++++++++++++++++++++
    getTokenOMISE();

  }
  Future<void> getTokenOMISE()async{
    String PUBLICKEY ='pkey_test_5pbs2hopunn8gf11dk3';

    print("$_nameController");
    print("$_surnameController");
    print("$_idCard");
    print("$subexpiryDateMouth");
    print("$subexpiryDateYear");
    print("$cvc");
    print("$amount");
    print ("$PUBLICKEY");


    OmiseFlutter omise = OmiseFlutter(PUBLICKEY);
    await omise
        .token
    //.create('$_nameController $_surnameController', _idCard!, subexpiryDateMouth!, subexpiryDateYear!, cvc!
        .create("John Doe", "4242424242424242", "12", "2020", "123"
    ).then((value){
      String token = value.id.toString();
      print("Token $token");
      print("Token");
    });

  }
}