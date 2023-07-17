library globals;

import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

part 'keys.dart';
part 'regexp.dart';

class _Global {
  late final SharedPreferences prefs;
  late final BaseDeviceInfo deviceInfo;
  late String? authorization;
  UserModel user = fakerUser();

  final keys = _Keys();
  final regexp = _Regexp();
  final logger = Logger();

  Future<void> intialize() async {
    prefs = await SharedPreferences.getInstance();
    Logger.level = Level.debug;
    authorization = prefs.getString(keys.authorization);
    if (authorization != null) {
      try {
        final $user = prefs.getString(keys.user);
        if ($user != null) {
          user = UserModel.fromJson(jsonDecode($user));
        }
      } catch (e) {
        await ProviderContainer().read(userProvider.notifier).updateUser();
      }
    }
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
    http.dio?.options.headers.update(
      key,
      (value) => newToken,
      ifAbsent: () => newToken,
    );
  }

  updateUser(UserModel $user) {
    user = $user;
    prefs.setString(keys.user, jsonEncode(user.toJson()));
  }
}

var global = _Global();
