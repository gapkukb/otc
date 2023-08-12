import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/providers/provider.dart';
import 'package:otc/providers/wallet.provider.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(global.user);

  Timer? _timer;

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final token = await apis.user.login({
      "username": username,
      "password": password,
    });

    global.updateAuthorization(token);
    timerRefreshToken();
    return await updateUser();
  }

  Future<UserModel> updateUser() async {
    final user = await apis.user.getUser();
    global.updateUser(user);
    updateShouldNotify(state, user);
    state = user;
    provider.read(authProvider.notifier).state = true;
    provider.read(walletProvider.notifier).updateWallet();
    return user;
  }

  modify(UserModel user) {
    state = user;
  }

  FutureOr<void> logout() {
    final newState = fakerUser();
    updateShouldNotify(state, newState);
    state = newState;
    global.updateUser(state);
    global.updateAuthorization(null);
    _timer?.cancel();
    provider.read(authProvider.notifier).state = false;
  }

  void updateNickName(String nickname) {
    final newBase = state.base.copyWith(nickname: nickname);
    state = state.copyWith(base: newBase);
  }

  void timerRefreshToken() {
    // 15分钟刷新一次令牌
    _timer = Timer.periodic(const Duration(minutes: 5), (timer) async {
      final token = await apis.security.refreshToken();
      global.updateAuthorization(token);
      provider.read(authProvider.notifier).state = true;
    });
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
