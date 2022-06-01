import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omise_flutter/omise_flutter.dart';

/// Get your public key on Omise Dashboard


const publicKey = "pkey_test_5pbs2hopunn8gf11dk3";
OmiseFlutter omise = OmiseFlutter(publicKey);

class TEST extends StatefulWidget {
  const TEST({Key? key}) : super(key: key);

  @override
  _TESTState createState() => _TESTState();
}

class _TESTState extends State<TEST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: exampleCreateSource(),
              child: Container(
                child: Text("TEST"),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/// OmiseFlutter provides direct access to Omise REST API
exampleCreateToken() async {
  // See Omise API documentation for details
  // https://www.omise.co/tokens-api
  // ignore: unused_local_variable
  final token = await omise.token
      .create("John Doe", "4242424242424242", "12", "2020", "123");

  // ignore: todo
  // TODO: You have to send the given token id back to your server.
}

exampleCreateSource() async {
  // See Omise API documentation for details
  // https://www.omise.co/sources-api
  final source =
  await omise.source.create(10000, "thb", "internet_banking_bay");

  print(source.id);
}

exampleRetrieveCapability() async {
  // See Omise API documentation for details
  // https://www.omise.co/capability-api
  final capability = await omise.capability.retrieve();

  print(capability.paymentMethods);
}