// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:skilldren/Models/FavVideoModel/fav_video_list_model.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/constant.dart';

class FavVideoListProvider extends ChangeNotifier {
  var mydata;
  String endpoint = 'favorite_video_list';
  String? error;
  Future<void> fetchApi() async {
    try {
      var dio = Dio();
      var fromdata = FormData.fromMap({
        'student_id': userIdVal,
      });
      var response = await dio.post(baseUrl + endpoint, data: fromdata);
      if (response.statusCode == 200) {
        debugPrint(response.data);
        mydata = FavVideoListModel.fromJson(jsonDecode(response.data));
        notifyListeners();
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
