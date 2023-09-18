// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:skilldren/Models/AddFavModel/add_fav_model.dart';
import 'package:skilldren/constant.dart';

import '../../Prefrenses/prefrenses.dart';

class AddFavProvider extends ChangeNotifier {
  var mydata;
  String endpoint = 'add_to_favorite';
  String? error;
  Future<void> fetchApi(subChapterId) async {
    try {
      var dio = Dio();
      var fromdata = FormData.fromMap({
        'sub_chapter_id': subChapterId,
        'student_id': userIdVal,
      });
      var response = await dio.post(baseUrl + endpoint, data: fromdata);
      if (response.statusCode == 200) {
        debugPrint(response.data);
        mydata = AddFavModel.fromJson(jsonDecode(response.data));
        notifyListeners();
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
