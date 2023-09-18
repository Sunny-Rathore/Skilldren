// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skilldren/Models/GetAllCategory/get_alllcategory_model.dart';
import 'package:skilldren/constant.dart';

class GetAllCategoryProvier with ChangeNotifier {
  var mydata;
  String error = "";
  Future<void> fetchAPI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response = await http.get(Uri.parse(baseUrl + 'get_all_category'));
      if (response.statusCode == 200) {
        debugPrint(jsonEncode(jsonDecode(response.body.toString())));
        mydata = GetAllcategoryModel.fromJson(jsonDecode(response.body));
        notifyListeners();

        // listlenghth = mydata.response.length;

        prefs.setInt("listlenght", mydata.response.length);

        notifyListeners();
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      error = e.toString();
      debugPrint("error :${e.toString()}");
    }
  }
}
