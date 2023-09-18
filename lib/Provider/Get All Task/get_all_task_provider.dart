// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skilldren/Models/get%20All%20Task/get_all_task_model.dart';
import 'package:skilldren/constant.dart';

import '../../Prefrenses/prefrenses.dart';

class GetAllTaskProvier with ChangeNotifier {
  var mydata;
  String error = "";
  Future<void> fetchAPI() async {
    var map = <String, dynamic>{};
    map['student_id'] = userIdVal;
    try {
      var response =
          await http.post(Uri.parse(baseUrl + 'get_all_task'), body: map);
      if (response.statusCode == 200) {
        print("___________________________________");
        debugPrint(jsonEncode(jsonDecode(response.body.toString())));
        mydata = getAllTaskModel.fromJson(jsonDecode(response.body));

        notifyListeners();
        print("___________________________________1");
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      error = e.toString();
      debugPrint("error :${e.toString()}");
    }
  }
}
