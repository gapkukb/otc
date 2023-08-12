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

  /// 是否已登录
  late String? authorization;

  /// 是否已验证是本人
  late String? captchaToken;
  late DateTime captchaTokenExpire;
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
    captchaTokenExpire = DateTime.fromMillisecondsSinceEpoch(prefs.getInt(keys.captchaTokenExpire) ?? 0);
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
    http.updateHeader(key, newValue);

    if (newValue == null) {
      prefs.remove(key);
    } else {
      prefs.setString(key, newValue);
    }
  }

  updateCaptchaToken(String? newValue) {
    final key = keys.captchaToken;
    global.captchaToken = newValue;
    http.updateHeader(key, newValue);
    if (newValue == null) {
      prefs.remove(key);
      prefs.remove(keys.captchaTokenExpire);
    } else {
      prefs.setString(key, newValue);
      // 后台15分钟过期，前端设置14分钟过期，尽量确保触发接口的验证逻辑
      captchaTokenExpire = DateTime.now().add(const Duration(minutes: 14));
      prefs.setInt(keys.captchaTokenExpire, captchaTokenExpire.millisecondsSinceEpoch);
    }
  }

  updateUser(UserModel newUser) {
    user = newUser;
    prefs.setString(keys.user, jsonEncode(user.toJson()));
  }
}

var global = _Global();
