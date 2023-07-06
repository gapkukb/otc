library globals;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

part 'keys.dart';
part 'regexp.dart';

class _Global {
  late final SharedPreferences prefs;
  late final BaseDeviceInfo deviceInfo;
  late String? authorization;

  final keys = _Keys();
  final regexp = _Regexp();
  final logger = Logger();

  Future<void> intialize() async {
    prefs = await SharedPreferences.getInstance();
    Logger.level = Level.debug;
    authorization = prefs.getString(keys.authorization);
  }

  setToken(String? newToken) {
    final String key = keys.authorization;

    authorization = newToken;

    if (newToken == null) {
      prefs.remove(key);
    } else {
      prefs.setString(key, newToken);
    }

    //ignore: invalid_null_aware_operator
    Http.dio?.options.headers.update(
      key,
      (value) => newToken,
      ifAbsent: () => newToken,
    );
  }
}

var global = _Global();
