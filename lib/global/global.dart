library globals;

import 'dart:convert';
import 'dart:developer';

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

  /// 是否已登录
  late String? authorization;

  /// 是否已验证是本人
  late String? captchaToken;
  UserModel user = fakerUser();

  final keys = _Keys();
  final regexp = _Regexp();
  final logger = Logger();

  Future<void> intialize() async {
    prefs = await SharedPreferences.getInstance();
    Logger.level = Level.debug;

    /// 缓存多用户数据，先获取用户名，再将之作为前缀
    final username = prefs.getString(keys.username);
    if (username != null) {
      SharedPreferences.setPrefix(username);
    }
    authorization = prefs.getString(keys.authorization);
    captchaToken = prefs.getString(keys.captchaToken);
    updateCaptchaToken(captchaToken);

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

  updateAuthorization(String? newValue) {
    final String key = keys.authorization;

    authorization = newValue;

    if (newValue == null) {
      prefs.remove(key);
    } else {
      prefs.setString(key, newValue);
    }
    http.updateHeader(key, newValue);
  }

  updateCaptchaToken(String? newValue) {
    // token 是用于免验证
    final key = keys.captchaToken;
    global.captchaToken = newValue;
    http.updateHeader(key, newValue);
    if (newValue == null) {
      prefs.remove(key);
    } else {
      prefs.setString(key, newValue);
    }
  }

  updateUser(UserModel newUser) {
    user = newUser;
    prefs.setString(keys.user, jsonEncode(user.toJson()));
  }
}

var global = _Global();
