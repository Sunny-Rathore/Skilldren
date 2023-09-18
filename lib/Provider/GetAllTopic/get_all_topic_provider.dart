// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skilldren/Models/GetAllTopic/getall_topic_model.dart';
import 'package:skilldren/constant.dart';

class GetAllTopicProvider with ChangeNotifier {
  var mydata;

  Future getAllTopicResponse(String cid) async {
    var map = <String, dynamic>{};
    map['category_id'] = cid;

    var response =
        await http.post(Uri.parse(baseUrl + "get_all_topic"), body: map);

    if (response.statusCode == 200) {
      debugPrint(jsonDecode(jsonEncode(response.body)));

      mydata = GetAllTopicModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      debugPrint(jsonEncode(mydata));
    }
  }
}
