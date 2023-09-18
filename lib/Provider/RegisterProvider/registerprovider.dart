import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skilldren/Models/Register/registermodel.dart';

import '../../constant.dart';
import 'package:http/http.dart' as http;

class RegisterProvider with ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var mydata;
  String error = '';

  Future getResiterResponse({mobile, name, grade}) async {
    try {
      var map = <String, dynamic>{};

      map['name'] = name;
      map['mobile'] = mobile;
      map['grade'] = grade;

      var response =
          await http.post(Uri.parse(baseUrl + "register"), body: map);

      if (response.statusCode == 200) {
        debugPrint(jsonDecode(jsonEncode(response.body)));
        mydata = RegisterModelModel.fromJson(jsonDecode(response.body));
        notifyListeners();
      }
      debugPrint("Data");
      debugPrint(jsonEncode(mydata));
    } catch (e) {
      error = e.toString();
      notifyListeners();
      debugPrint("error");
      debugPrint(error);
    }
  }
}
