library globals;

import 'package:shared_preferences/shared_preferences.dart';

part 'keys.dart';

class _Globals {
  late final SharedPreferences prefs;
  Future<void> intialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  final keys = _Keys();
}

var globals = _Globals();
