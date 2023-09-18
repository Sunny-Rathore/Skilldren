// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:skilldren/constant.dart';
import 'package:http/http.dart' as http;

import '../../Models/ReelModel/reel_model.dart';

class ReelProvider with ChangeNotifier {
  String endPint = "reel_list";
  String error = '';
  List reelcount = [];
  var myadata;
  Future<void> fetchAip() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + endPint),
      );
      if (response.statusCode == 200) {
        debugPrint(jsonEncode(jsonDecode(response.body)));

        myadata = ReelsdModel.fromJson(jsonDecode(response.body));
        for (int i = 0; i < myadata.response.length; i++) {
          reelcount.add(myadata.response[i].reelTotalLikes);
          notifyListeners();
        }
        notifyListeners();
        debugPrint(jsonEncode(myadata));
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}
