// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';
import 'package:http/http.dart' as http;

import '../../Models/TrasactionModel/transationmodel.dart';

class TransactionProvider with ChangeNotifier {
  String endPint = "transaction_history";
  String error = '';
  var myadata;
  Future<void> fetchAip() async {
    try {
      var map = <String, dynamic>{};
      map['student_id'] = userIdVal.toString();
      
      //userIdVal;
      var response = await http.post(Uri.parse(baseUrl + endPint), body: map);
      if (response.statusCode == 200) {
        // debugPrint(jsonEncode(jsonDecode(response.body)));

        myadata = TransactionModel.fromJson(jsonDecode(response.body));
        debugPrint(jsonEncode(myadata));
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
