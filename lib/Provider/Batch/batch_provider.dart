// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skilldren/Models/BatchModel/batch_model.dart';

import '../../constant.dart';

class BatchProvider extends ChangeNotifier {
  var mydata;

  Future fechApi() async {
    var response = await http.get(
      Uri.parse(baseUrl + "batch_list"),
    );

    if (response.statusCode == 200) {
      debugPrint(jsonDecode(jsonEncode(response.body)));

      mydata = BatchModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      debugPrint(jsonEncode(mydata));
    }
  }
}
