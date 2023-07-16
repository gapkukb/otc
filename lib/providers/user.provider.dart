import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/user/user.model.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(global.user);

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final token = await apis.user.login({
      "username": username,
      "password": password,
    });

    global.setToken(token);
    return await updateUser();
  }

  Future<UserModel> updateUser() async {
    final user = await apis.user.getUser();
    state = user;
    global.updateUser(user);
    return user;
  }

  modify(UserModel user) {
    state = user;
  }

  FutureOr<void> logout() {
    state = fakerUser();
    global.updateUser(state);
    global.setToken(null);
  }

  void updateNickName(String nickname) {
    final newBase = state.base.copyWith(nickname: nickname);
    state = state.copyWith(base: newBase);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});

final userBaseProvider = Provider(
  (ref) => ref.watch(userProvider.select((value) => value.base)),
);

final kycProvider = Provider(
  (ref) => ref.watch(userProvider.select((value) => value.kyc)),
);

final userStatsProvider = Provider(
  (ref) => ref.watch(userProvider.select((value) => value.stats)),
);

final authProvider = StateProvider<bool>((ref) {
  return global.authorization != null;
});
