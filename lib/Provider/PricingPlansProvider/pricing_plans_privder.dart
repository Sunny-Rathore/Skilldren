// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilldren/constant.dart';
import 'package:http/http.dart' as http;

import '../../Models/PricingPlanModel/pricingplanmodel.dart';

class PricingPlansProvider with ChangeNotifier {
  String endPint = "subscription_list";
  String error = '';
  var myadata;
  Future<void> fetchAip(String plannumber) async {
    var map = <String, dynamic>{};
    map['subscription_type'] = plannumber.toString();
    try {
      var response = await http.post(Uri.parse(baseUrl + endPint), body: map);
      if (response.statusCode == 200) {
        debugPrint(jsonEncode(jsonDecode(response.body)));

        myadata = SubPalnListModel.fromJson(jsonDecode(response.body));
        debugPrint(jsonEncode(myadata));
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
