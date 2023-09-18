// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:skilldren/Models/ReelLikeModel/reel_like_model.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';

class ReelLikeProvider extends ChangeNotifier {
  var mydata;
  String endpoint = 'add_to_reel_like';
  String? error;
  Future<void> fetchApi(reelId) async {
    try {
      var dio = Dio();
      var fromdata = FormData.fromMap({
        'student_id': userIdVal,
        'reel_id': reelId,
      });
      var response = await dio.post(baseUrl + endpoint, data: fromdata);
      if (response.statusCode == 200) {
        debugPrint(response.data);
        mydata = likeReelModel.fromJson(jsonDecode(response.data));
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
