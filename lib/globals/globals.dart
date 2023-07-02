library globals;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'keys.dart';
part 'regexp.dart';

class _Globals {
  late final SharedPreferences prefs;
  late final BaseDeviceInfo deviceInfo;
  Future<void> intialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  final keys = _Keys();
  final regexp = _Regexp();
}

var globals = _Globals();
