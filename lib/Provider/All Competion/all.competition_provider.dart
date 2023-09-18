// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skilldren/Models/get%20All%20Competion/get_all_competiom_model.dart';
import 'package:skilldren/constant.dart';

class GetAllCompetionProvier with ChangeNotifier {
  var mydata;
  String error = "";
  Future<void> fetchAPI() async {
    try {
      var response =
          await http.get(Uri.parse(baseUrl + 'get_all_competitions'));
      if (response.statusCode == 200) {
        debugPrint(jsonEncode(jsonDecode(response.body.toString())));
        mydata = getAllCompetionModel.fromJson(jsonDecode(response.body));

        notifyListeners();
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      error = e.toString();
      debugPrint("error :${e.toString()}");
    }
  }
}
