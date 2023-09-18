import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skilldren/Prefrenses/prefrenses.dart';
import 'package:skilldren/views/Login_SingUp/login.dart';
import 'package:skilldren/views/NewUI/NewHome.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    pref();
    check();
    super.initState();
  }

  String? userid;
  pref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userIdVal = preferences.getString(userIdKey);
    userid = preferences.getString(userIdKey);
    name = preferences.getString(nameKey);
    debugPrint(userIdVal);
  }

  void check() {
    super.initState();
    Timer(const Duration(microseconds: 100), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              userid != null ? const NewHomePage() : const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
