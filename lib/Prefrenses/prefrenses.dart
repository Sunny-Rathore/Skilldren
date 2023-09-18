import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userIdKey = "userIdKey";
String nameKey = "name_key";
String activityKey = "Activity_status";

String challengestatus = "challenge_status";

String dailyReminder = "daily_Reminder";

String eventsReminder = "events_Reminder";
String? userIdVal;
String? name;
// int? notifie;
String notifekey = 'Notifle_key';

class Prefrenses with ChangeNotifier {
  // ignore: non_constant_identifier_names
  bool? actitvi_status;
  // ignore: non_constant_identifier_names
  bool? challange_status = true;
  // ignore: non_constant_identifier_names
  bool? daily_Reminder;
  // ignore: non_constant_identifier_names
  bool? evenst_Reminder;
  int? notifie;
  Future<void> setNotifie(value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    preferences.setInt(notifekey, value);
  }

  Future<void> getpref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userIdVal = preferences.getString(userIdKey);
    notifyListeners();
    name = preferences.getString(nameKey);
    notifyListeners();
    actitvi_status = preferences.getBool(activityKey);
    notifyListeners();
    challange_status = preferences.getBool(challengestatus);
    notifyListeners();
    daily_Reminder = preferences.getBool(dailyReminder);
    notifyListeners();
    evenst_Reminder = preferences.getBool(eventsReminder);
    notifyListeners();
    notifie = preferences.getInt(notifekey);
    notifyListeners();
  }
}
