// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skilldren/Models/Submit%20Task%20Model/submit_task_model.dart';
import 'package:skilldren/constant.dart';

import '../../Prefrenses/prefrenses.dart';
import 'package:http/http.dart' as http;

class SubmitTaskProvider with ChangeNotifier {
  var mydata;

  String? error;
  String endpoint = 'student_submit_task';
  Future<void> fechApi({image, tid, required int tasktype}) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + endpoint));
      request.files.add(await http.MultipartFile.fromPath('images[0]', image));
      request.fields['student_id'] = userIdVal.toString();
      request.fields['task_id'] = tid;
      request.fields['task_type'] = '1';
      //request.fields['answer'] = userIdVal.toString();
      var response = await request.send();
      // if(response.statusCode==200){
      //   mydata = SubmitTaskModel.fromJson(jsonDecode(response.))
      // }

      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((event) {
          mydata = SubmitTaskModel.fromJson(jsonDecode(event));
          notifyListeners();
          debugPrint("status_code:" + response.statusCode.toString());
          debugPrint(jsonEncode(mydata));
        });
      }
    } catch (e) {
      error = e.toString();
      debugPrint('error: ${e.toString()}');
      notifyListeners();
    }
  }

  Future<void> fechApiDio(
      {required image, required tid, required tasktype}) async {
    try {
      String endpoint = 'student_submit_task';
      var dio = Dio();

      FormData formData = FormData.fromMap({
        'student_id': userIdVal.toString(),
        'task_id': tid,
        'task_type': tasktype,
        'images[0]': MultipartFile.fromFile(image)
      });

      var response = await dio.post(baseUrl + endpoint, data: formData);
      debugPrint(response.statusCode.toString());
      debugPrint("object");
      debugPrint(response.data);

      if (response.statusCode == 200) {
        mydata = SubmitTaskModel.fromJson(jsonDecode(response.data));
        notifyListeners();
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
