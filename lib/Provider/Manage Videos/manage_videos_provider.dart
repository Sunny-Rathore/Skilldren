// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skilldren/ErrorHandling/erros.dart';
import 'package:skilldren/Models/Manage%20Videos/manage_videos_model.dart';
import 'package:skilldren/constant.dart';

class ManageVideosProvider with ChangeNotifier {
  String endpoint = 'video_list';
  // ignore: prefer_typing_uninitialized_variables
  var mydata;
  Future<void> fechApi() async {
    try {
      var dio = Dio();

      var response = await dio.get(baseUrl + endpoint);

      if (response.statusCode == 200) {
        mydata = ManageVideoModel.fromJson(jsonDecode(response.data));
        debugPrint(jsonEncode(mydata));
      }
    } on DioError catch (e) {
      var error = DioExceptions.fromDioError(e).toString();
      notifyListeners();
      Fluttertoast.showToast(msg: error);
    }
  }
}
