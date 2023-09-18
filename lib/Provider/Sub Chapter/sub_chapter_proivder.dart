// ignore_for_file: file_names, prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skilldren/ErrorHandling/erros.dart';
import 'package:skilldren/Models/Sub%20Chapter/sub_chapter_model.dart';

import '../../constant.dart';

class SubChapterProvider with ChangeNotifier {
  var mydata;
  String error = '';
  String endpoint = 'sub_chapter_list';
  Future<void> fechApi(String chapterId) async {
    try {
      FormData formData = FormData.fromMap({
        'chapter_id': chapterId,
      });

      var dio = Dio();
      var dioResponse = await dio.post(baseUrl + endpoint, data: formData);
      if (dioResponse.statusCode == 200) {
        debugPrint(dioResponse.data);
        mydata = SubChapterModel.fromJson(jsonDecode(dioResponse.data));
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
