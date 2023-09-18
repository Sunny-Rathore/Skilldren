// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:skilldren/constant.dart';

import '../../Models/getAllChapter/get_all_chapter_model.dart';

class GetAllChapterProvider with ChangeNotifier {
  var mydata;

  Future getAllchapterResponse({cid, level}) async {
    try {
      var map = <String, dynamic>{};

      map['category_id'] = cid.toString();
      map['chapter_level'] = level;
      var response =
          await http.post(Uri.parse(baseUrl + "chapter_list"), body: map);

      if (response.statusCode == 200) {
        debugPrint(jsonDecode(jsonEncode(response.body)));
        mydata = GetAllChapterModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        debugPrint(jsonEncode(mydata));
      }
    } catch (e) {
      debugPrint("error" + e.toString());
    }
  }
}
