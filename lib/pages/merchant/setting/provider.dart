import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/pages/merchant/setting/model.dart';

final merchantSettingProvider = FutureProvider<MerchantSettingModel>((ref) async {
  return await apis.merchant.getSetting();
});
