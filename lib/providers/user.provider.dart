import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user_model.dart';

final cachedUser = global.prefs.getString(global.keys.user);
final faker = UserModel(
  id: -1,
  username: "",
  email: "",
  phone: "",
  regIp: "",
  regServerName: "",
  regReferer: "",
  regDevice: "",
  emailValid: false,
  idValid: false,
  phoneValid: false,
  nickname: "",
  avatar: "",
  disabled: false,
  type: "",
  invitationCode: "",
  lockedUntil: "",
  locked: false,
  createdTime: "",
  payPass: false,
);

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(
          cachedUser == null
              ? faker
              : UserModel.fromJson(jsonDecode(cachedUser!)),
        );

  bool get hasLoggedIn {
    return state.username != "";
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
    state = faker;
    global.setToken(null);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});
