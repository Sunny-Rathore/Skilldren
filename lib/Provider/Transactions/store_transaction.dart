// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skilldren/Models/TrasactionModel/store_transaction_model.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';
import 'package:http/http.dart' as http;

class StoreTransactionProvider with ChangeNotifier {
  String endPint = "store_transaction";
  String error = '';
  var myadata;
  Future<void> fetchAip() async {
    try {
      var map = <String, dynamic>{};
      map['plan_id'] = '1';
      map['student_id'] = userIdVal.toString();
      map['transaction_number'] = 'demo';
      map['amount'] = "40";
      map['payment_status'] = '1';

      //userIdVal;
      var response = await http.post(Uri.parse(baseUrl + endPint), body: map);
      if (response.statusCode == 200) {
        // debugPrint(jsonEncode(jsonDecode(response.body)));

        myadata = StoreTransactionModel.fromJson(jsonDecode(response.body));
        debugPrint(jsonEncode(myadata));
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
