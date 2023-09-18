// ignore_for_file: file_names, prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skilldren/ErrorHandling/erros.dart';

import '../../Models/loginModel/loginmodel.dart';
import '../../constant.dart';

class LoginProvider with ChangeNotifier {
  var mydata;
  String error = '';

  Future<void> fechDatatDio(mobile) async {
    try {
      FormData formData = FormData.fromMap({
        'mobile': mobile,
      });

      var dio = Dio();
      var dioResponse = await dio.post(baseUrl + "login", data: formData);
      if (dioResponse.statusCode == 200) {
        debugPrint(dioResponse.data);
        mydata = LoginModel.fromJson(jsonDecode(dioResponse.data));
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
