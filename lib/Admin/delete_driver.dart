import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDriver extends StatefulWidget {
  const DeleteDriver({Key? key}) : super(key: key);

  @override
  _DeleteDriverState createState() => _DeleteDriverState();
}
class _DeleteDriverState extends State<DeleteDriver> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: "Delete Driver User",),
              Tab(icon: Icon(Icons.event_note_sharp), text: "Delete Driver History"),
            ],
          ),
          title: Text('Delete Driver'),
        ),
        body: TabBarView(
          children: [
            TasksPageOne(),
            TasksPageTow(),
          ],
        ),
      ),
    );
  }
}



class TasksPageOne extends StatelessWidget {
  Widget _buildList(QuerySnapshot snapshot) {
    return Container(
      //color: Colors.blue,
      child: ListView.builder(
          itemCount: snapshot.docs.length,
          itemBuilder: (context, index) {
            final doc = snapshot.docs[index];
            return Dismissible(
              key: Key(doc.id),
              background: Container(color: Colors.red[700]),
              onDismissed: (direction) {
                print("OK");
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.INFO,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Delete Driver !?',
                  desc: 'Do you want to delete Driver ?',
                  btnCancelOnPress: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => DeleteDriver()));
                  },
                  btnOkOnPress: () {
                    FirebaseFirestore.instance
                        .collection("DriverLogin")
                        .doc(doc.id)
                        .delete().then((value) => (){});
                  },
                )..show();
              },
              child: ListTile(
                  title: Container(
                      child: Container(
                //alignment: Alignment.centerLeft,
                height: 80,
                child: Card(
                    color: Colors.white,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, right: 0, left: 20, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              "${doc["driver_name"]}",
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    )),
              ))),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              children: [
            Container(
              height: 80,
              width: 80,
              child: Image.asset("image/van.gif"),
            ),
                SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Text("Driver Username ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                ),
              ],
            ),
            SizedBox(height: 10,),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("DriverLogin")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return LinearProgressIndicator();
                    return Expanded(
                      child: _buildList(snapshot.data!));
                })
          ]),
        ));
  }
}
class TasksPageTow extends StatelessWidget {
  Widget _buildList(QuerySnapshot snapshot) {
    return Container(
      child: ListView.builder(
          itemCount: snapshot.docs.length,
          itemBuilder: (context, index) {
            final doc = snapshot.docs[index];
            return Dismissible(
              key: Key(doc.id),
              background: Container(color: Colors.red[700]),
              onDismissed: (direction) {
                print("OK");
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.INFO,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Delete Driver !?',
                  desc: 'Do you want to delete Driver ?',
                  btnCancelOnPress: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => DeleteDriver()));
                  },
                  btnOkOnPress: () {
                    FirebaseFirestore.instance
                        .collection("Driver_history")
                        .doc(doc.id)
                        .delete().then((value) => (){});
                  },
                )..show();
              },
              child: ListTile(
                  title: Container(
                      child: Container(
                        //alignment: Alignment.centerLeft,
                        height: 80,
                        child: Card(
                            color: Colors.white,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 10, right: 0, left: 20, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      "${doc["DriverID"]}",
                                      style: TextStyle(fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ))),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset("image/van.gif"),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Text("Driver UID",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("DriverLogin")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return LinearProgressIndicator();
                      return Expanded(
                          child: _buildList(snapshot.data!));
                    })
              ]),
        ));
  }
}
