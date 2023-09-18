// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../ErrorHandling/erros.dart';
import '../../Models/LeaderBoard/leaderboard_model.dart';
import '../../constant.dart';

class RankListProvider with ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var mydata;
  String endPoint = 'leader_board';
  Future<void> fechApi() async {
    try {
      var dio = Dio();
      var dioResponse = await dio.get(
        baseUrl + endPoint,
      );
      if (dioResponse.statusCode == 200) {
        debugPrint(dioResponse.data);
        mydata = LeaderBoardModel.fromJson(jsonDecode(dioResponse.data));
        notifyListeners();
      }
    } on DioError catch (e) {
      debugPrint("errpr:" + e.toString());
      String error = DioExceptions.fromDioError(e).toString();
      Fluttertoast.showToast(msg: error);
      debugPrint(e.toString());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
