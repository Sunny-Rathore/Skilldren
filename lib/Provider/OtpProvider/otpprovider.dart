// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skilldren/Models/otpModel/otpmodel.dart';
import 'package:skilldren/constant.dart';

class OtpProvider with ChangeNotifier {
  String error = '';
  var maydata;
  Future<void> fetchApiResponse({mobnumber, otp}) async {
    try {
      var map = <String, dynamic>{};
      map['mobile'] = mobnumber.toString();
      map['otp'] = otp.toString();
      var response = await http.post(
          Uri.parse(
            baseUrl + "verify_opt",
          ),
          body: map);
      debugPrint('response');
      debugPrint(jsonEncode(jsonDecode(response.body)));

      if (response.statusCode == 200) {
        maydata = OtpModel.fromJson(jsonDecode(response.body));
        debugPrint('maydata');
        debugPrint(jsonEncode(maydata));
        notifyListeners();
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
