import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange[800],
        title: Text("Wallets",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Container(/*gard*/
                padding: EdgeInsets.only(top:20),
              child: Center(
                child: Card(
                    elevation: 20,
                    color: Colors.amber[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                      width: 350,
                      height: 200,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                         Container(/*icon and name*/
                           padding: EdgeInsets.only(top: 10),
                         child: Row(
                           children: [
                             Icon(Icons.monetization_on_outlined,color: Colors.white,size: 45,),
                             SizedBox(width: 10,),
                             Text(" Saharat Prangmoo",style: TextStyle(color: Colors.white,fontSize: 25),),
                           ],
                         )),
                          SizedBox(height: 20,),
                          Container(/*number Wallet*/
                          child: Text("123"),
                          ),
                           SizedBox(height: 20,),
                           Container(/*ยอดเงินที่ใช้ได้*/
                           child: Text("123"),)
                        ],
                      ),
                    )),
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
