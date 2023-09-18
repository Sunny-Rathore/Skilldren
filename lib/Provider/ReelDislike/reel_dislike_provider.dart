// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:skilldren/constant.dart';

import '../../Models/ReelDislikeModel/reel_dislike_model.dart';
import '../../Prefrenses/prefrenses.dart';

class ReelDislikeProvider extends ChangeNotifier {
  var mydata;
  String endpoint = 'delete_to_reel_like';
  String? error;
  Future<void> fetchApi(reelId) async {
    try {
      var dio = Dio();
      var fromdata = FormData.fromMap({
        'reel_id': reelId,
        'student_id': userIdVal,
      });
      var response = await dio.post(baseUrl + endpoint, data: fromdata);
      if (response.statusCode == 200) {
        debugPrint(response.data);
        mydata = RealDislikeModelModel.fromJson(jsonDecode(response.data));
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
