import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';

class BanksNotifier extends StateNotifier<List<Map<String, String>>> {
  BanksNotifier() : super([]);

  update() async {
    final banks = (await apis.wallet.supportedBanks() as Map).cast<String, String>();
    state = banks.entries.map((e) => {e.key: e.value}).toList();
  }
}

final banksProvider = FutureProvider<List<Map<String, String>>>((ref) async {
  final banks = (await apis.wallet.supportedBanks() as Map).cast<String, String>();
  return banks.entries.map((e) => {"code": e.key, "name": e.value}).toList();
});
