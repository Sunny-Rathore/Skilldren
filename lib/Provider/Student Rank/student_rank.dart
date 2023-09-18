// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skilldren/ErrorHandling/erros.dart';
import 'package:skilldren/Models/Student%20Rank/student_rankModel.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';

class StudentRankProvider with ChangeNotifier {
  String endpoint = 'student_rank';
  // ignore: prefer_typing_uninitialized_variables
  var mydata;
  Future<void> fechApi() async {
    try {
      var dio = Dio();
      FormData formData =
          FormData.fromMap({"student_id": userIdVal.toString()});
      var response = await dio.post(baseUrl + endpoint, data: formData);

      if (response.statusCode == 200) {
        mydata = StudentRankModel.fromJson(jsonDecode(response.data));
        // debugPrint(jsonEncode(mydata));
      }
    } on DioError catch (e) {
      var error = DioExceptions.fromDioError(e).toString();
      notifyListeners();
      Fluttertoast.showToast(msg: error);
    }
  }
}
