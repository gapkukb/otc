import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/wallet.bank/wallet.bank.model.dart';
import 'package:otc/models/wallet.qrcode/wallet.qrcode.model.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';

final bankProvider = FutureProvider<List<WalletBankModel>>((ref) async {
  final value = await apis.wallet.getAllBankCards();

  return value.map((e) => WalletBankModel.fromJson(e)).toList();
});

final qrcodeProvider = FutureProvider.family<List<WalletQrcodeModel>, AddType>((ref, addType) async {
  final value = await apis.wallet.getAllQRcode({"method": addType.type});

  return value.map((e) => WalletQrcodeModel.fromJson(e)).toList();
});
