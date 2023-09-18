// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skilldren/Models/LiveClassModel/liveclass_model.dart';
import 'package:skilldren/constant.dart';
import 'package:http/http.dart' as http;

class LiveClassProvider with ChangeNotifier {
  String endPint = "live_class";
  String error = '';
  var mydata;
  Future<void> fetchAip(status, batchId) async {
    try {
      var map = <String, dynamic>{};
      map['class_status'] = status;
      map['batch_id'] = batchId.toString();
      var response = await http.post(Uri.parse(baseUrl + endPint), body: map);
      if (response.statusCode == 200) {
        // debugPrint(jsonEncode(jsonDecode(response.body)));

        mydata = LiveClassModel.fromJson(jsonDecode(response.body));
        debugPrint(jsonEncode(mydata));
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
