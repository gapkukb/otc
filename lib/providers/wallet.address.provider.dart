import 'dart:developer';

import 'package:otc/apis/apis.dart';
import 'package:otc/models/address/address.model.dart';
import 'package:riverpod/riverpod.dart';

final walletAddressProvider = FutureProvider<List<AddressModel>>((ref) async {
  final result = await apis.wallet.getAddressBook();
  final addresses = result.map((item) => AddressModel.fromJson(item)).toList();
  return addresses;
});
