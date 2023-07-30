import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/global/global.dart';

List<Cryptocurrency> init() {
  final coins = global.prefs.getString("coins");
  if (coins == null) return [];
  return toCoin(jsonDecode(coins) as Map);
}

List<Cryptocurrency> toCoin(Map coins) {
  return coins.keys.map((entry) {
    return Cryptocurrency.values.firstWhere((element) => element.name == entry);
  }).toList();
}

final coinProvider = FutureProvider<List<Cryptocurrency>>((ref) async {
  final Map coins = await apis.otc.getCoins();
  final result = toCoin(coins);
  await global.prefs.setString("coins", jsonEncode(coins));
  return result;
});
