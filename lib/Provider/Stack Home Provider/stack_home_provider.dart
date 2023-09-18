import 'package:flutter/cupertino.dart';

class StackHomeProvider extends ChangeNotifier {
  int _stackindex = 0;
  get stackindex => _stackindex;
  void changeindex(int index) {
    _stackindex = index;
    notifyListeners();
  }
}
