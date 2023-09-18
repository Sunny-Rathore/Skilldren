// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, deprecated_member_use

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:skilldren/constant.dart';

import '../../ErrorHandling/erros.dart';
import '../../Models/UpdateProfile/update_profile_model.dart';
import '../../Prefrenses/prefrenses.dart';
import 'package:http/http.dart' as http;

class UpdateProfileProvider with ChangeNotifier {
  var mydata;
  String? error;
  String enpoint = 'update_profile';

  Future<void> fechApiDio(
      {required fname,
      lname,
      grade,
      age,
      email,
      dob,
      address,
      state_id,
      district_id,
      city_id,
      pincode_id,
      image}) async {
    try {
      var formdata = FormData.fromMap({
        'grade': grade,
        'student_id': userIdVal,
        'first_name': fname.toString(),
        // 'last_name': lname.toString(),
        // 'grade': grade,
        // 'age': age,
        // 'email': email,
        // 'dob': dob,
        // 'address': address,
        // 'state_id': state_id,
        // 'district_id': district_id,
        // 'city_id': city_id,
        // 'pincode_id': pincode_id,
        'image': MultipartFile.fromFile(image)
      });
      var dio = Dio();
      var response = await dio.post(baseUrl + enpoint, data: formdata);
      if (response.statusCode == 200) {
        mydata = UpdateProfileModel.fromJson(jsonDecode(response.data));
        notifyListeners();
        debugPrint(jsonEncode(mydata));
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

  Future<void> fetchApi(
      {required fname,
      lname,
      grade,
      age,
      email,
      dob,
      address,
      state_id,
      district_id,
      city_id,
      pincode_id,
      image}) async {
    try {
      var requrest =
          http.MultipartRequest('POST', Uri.parse(baseUrl + enpoint));

      // requrest.files.add(await http.MultipartFile.fromPath('image', image));
      if (image != null) {
        requrest.files.add(await http.MultipartFile.fromPath('image', image));
      }

      requrest.fields['student_id'] = userIdVal.toString();
      requrest.fields['first_name'] = fname;
      requrest.fields['grade'] = grade;
      if (grade != null) {
        requrest.fields['last_name'] = lname;
      }
      if (age != null) {
        requrest.fields['age'] = age;
      }
      if (email != null) {
        requrest.fields['email'] = email;
      }
      if (dob != null) {
        requrest.fields['dob'] = dob;
      }

      if (address != null) {
        requrest.fields['address'] = address;
      }
      if (state_id != null) {
        requrest.fields['state_id'] = state_id;
      }

      if (district_id != null) {
        requrest.fields['district_id'] = district_id;
      }
      if (city_id != null) {
        requrest.fields['city_id'] = city_id;
      }
      if (pincode_id != null) {
        requrest.fields['pincode_id'] = pincode_id;
      }

      var response = await requrest.send();
      debugPrint("Status code:-----------------------");
      debugPrint("status_code:" + response.statusCode.toString());
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((event) {
          mydata = UpdateProfileModel.fromJson(jsonDecode(event));
          notifyListeners();

          debugPrint(jsonEncode(mydata));
        });
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      error = e.toString();
      notifyListeners();
    }
  }
}
