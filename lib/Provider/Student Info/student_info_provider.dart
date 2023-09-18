// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:skilldren/Models/StudentInfo%20Model/student_info_model.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';

class StudentInfoProvider with ChangeNotifier {
  var mydata;
  String? error;
  String endppint = 'get_stundet_info';

  Future<void> fetchApi() async {
    var map = <String, dynamic>{};
    map['student_id'] = userIdVal;
    //userIdVal.toString();
    var response = await http.post(Uri.parse(baseUrl + endppint), body: map);
    // debugPrint(jsonEncode(jsonDecode(response.body)));

    if (response.statusCode == 200) {
      mydata = StudentInfoModel.fromJson(jsonDecode(response.body));
      notifyListeners();

      // debugPrint('Student Info:');
      // debugPrint(jsonEncode(mydata));
      // debugPrint('Student Info:');
    }
  }
}
