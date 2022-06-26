import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../MODAL_DATA/get_amoung_fribase.dart';
import '../../_test.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  List<amoungModal> productModals1 = [];
  List<Widget> wid = [];
  @override
  void initState() {
    _GetAmougOmise();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: Text(
          "ประวัติการโอนเงิน",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Container(
          child: wid.length == 0
              //CircularProgressIndicator()
              ? Center(
                  child: Container(
                  padding: EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset("image/van.gif"),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          "No Information",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ))
              : Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
                    child: Text("ประวัติรายการย้อนหลัง",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ListView(
            children: wid
          ),
                  ),
                ],
              )
        ),
      ),
    );
  }

  void _GetAmougOmise() async {
    final User? user = auth.currentUser;
    final Uid = user?.uid;
    final data = await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('WalletUserOMISE')
          .doc(Uid)
          .collection("AMOUNTOMISE")
          .snapshots()
          .listen((event) {
        int indexs = 0;
        for (var snap in event.docs) {
          Map<String, dynamic> map = snap.data();
          amoungModal modalAddmin = amoungModal.fromMapAddmin(map);
          productModals1.add(modalAddmin);
          //nane product
          var modalOmi = modalAddmin;
          print('amount  = ${modalOmi.amount}');
          print('name  = ${modalOmi.name}');
          print('name  = ${modalOmi.time}');
          setState(() {
            wid.add(creatWid(modalOmi, indexs));
          });
          indexs++;
        }
      });
    });
  }

  Widget creatWid(amoungModal modalOmi, int indexs) => GestureDetector(
    onTap: (){},
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10,top: 5),
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 20,),
                  Container(width: 50, height: 50, child: Center(child: Image.asset("image/van.gif"))),
                  SizedBox(width: 20,),
                  Container(child: Center(child: Text("${modalOmi.name}",style: TextStyle(fontSize: 16),)),),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.end ,
                      children: [
                        Text("${modalOmi.time}",style: TextStyle(fontSize: 14,)),
                        SizedBox(height: 10,),
                        Text("${modalOmi.amount}.00",style: TextStyle(fontSize: 16,color: Colors.red[800],fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
