library globals;

import 'package:shared_preferences/shared_preferences.dart';

part 'prefs.dart';

class Globals {
  static late final SharedPreferences prefs;
  static Future<void> intialize() async {
    prefs = await SharedPreferences.getInstance();
  }
}
