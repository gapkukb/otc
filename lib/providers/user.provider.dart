import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user_model.dart';

final cachedToken = global.prefs.getString(global.keys.user);

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier()
      : super(cachedToken == null
            ? null
            : UserModel.fromJson(jsonDecode(cachedToken!)));

  bool get hasLoggedIn {
    return state != null;
  }

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final token = await apis.user.login();
    global.setToken(token);
    final user = await apis.user.getUser();

    // global.setToken(user.);
    global.prefs.setString(global.keys.user, jsonEncode(user));

    state = user;

    return user;
  }

  refreshToken() {}

  FutureOr<void> logout() {
    state = null;
    global.setToken(null);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});
