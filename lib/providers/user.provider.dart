import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/providers/provider.dart';

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

    global.updateAuthorization(token);
    return await updateUser();
  }

  Future<UserModel> updateUser() async {
    final user = await apis.user.getUser();
    state = user;
    global.updateUser(user);
    provider.read(authProvider.notifier).state = true;
    return user;
  }

  modify(UserModel user) {
    state = user;
  }

  FutureOr<void> logout() {
    state = fakerUser();
    global.updateUser(state);
    global.updateAuthorization(null);
    provider.read(authProvider.notifier).state = false;
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

final kycAuthProvider = Provider<bool>(
  (ref) => ref.watch(kycProvider.select((value) => value?.lv1Status == KycStatus.pass)),
);

final userStatsProvider = Provider(
  (ref) => ref.watch(userProvider.select((value) => value.stats)),
);

final authProvider = StateProvider<bool>((ref) {
  return global.authorization != null;
});
