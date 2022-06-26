import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

String pk = "pkey_test_5pbs2hopunn8gf11dk3";
Future<dynamic> createToken(String number, String name, int month, int year, String cvv) async {
  try {
    http.Response response = await http.post(
        Uri.parse("https://vault.omise.co/tokens"),
        headers: {
          'Authorization':
          'Basic ' +base64Encode(utf8.encode('$pk')),
          'Omise-Version': '2019-05-29',
          'Cache-Control':'no-cache',
          'Content-type':'Application/json'
        },
        body: jsonEncode({
        'card': {
        'name': name,
        'number': number,
        'expiration_month':month,
        'expiration_year':year,
        'security_code':cvv
        }
        }));
    return jsonDecode(response.body)["id"];
  } catch (e) {
    throw (e);
  }
}

String sk = "skey_test_5pbs2hopu0zmtbve1bk";
Future<dynamic> omiseCharge(String token, int amount,String currency ) async {
  try {
    http.Response response =
    await http.post(Uri.parse("https://api.omise.co/charges"),
        headers: {
          'Authorization': 'Basic ' +base64Encode(utf8.encode('$sk:')),
          'Cache-Control':'no-cache',
          'Content-Type':'application/json'
        },
        body: jsonEncode({'amount': amount, 'card': token, 'currency':currency,}));
    return jsonDecode(response.body);
  } catch (e) {
    throw (e);
  }
}
//       dynamic charOB = omiseCharge(tokenOmise, 10000,"THB");
//       print(charOB);