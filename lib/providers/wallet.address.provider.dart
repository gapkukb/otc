import 'package:otc/apis/apis.dart';
import 'package:otc/models/address/address.model.dart';
import 'package:riverpod/riverpod.dart';

final walletAddressProvider = FutureProvider<List<AddressModel>>((ref) async {
  final result = await apis.wallet.getAddressBook();
  return result.map((item) => AddressModel.fromJson(item)).toList();
});
