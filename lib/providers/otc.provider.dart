import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/global/global.dart';
import 'package:otc/models/otc/otc.model.dart';

class OtcNotifier extends StateNotifier<OtcModel> {
  OtcNotifier() : super(init());

  updateOTC() async {
    state = await apis.user.getOtcConfig();
    global.prefs.setString(global.keys.otcConfig, json.encode(state.toJson()));
    return state;
  }

  static OtcModel init() {
    try {
      final string = global.prefs.getString(global.keys.otcConfig);
      return OtcModel.fromJson(json.decode(string!));
    } catch (e) {
      return const OtcModel(
        enabled: false,
        kycLevel: 0,
        bankcardReceiptMin: 0,
        bankcardReceiptMax: 0,
        bankcardReceiptDaily: 0,
        wechatReceiptMin: 0,
        wechatReceiptMax: 0,
        wechatReceiptDaily: 0,
        aliReceiptMin: 0,
        aliReceiptMax: 0,
        aliReceiptDaily: 0,
        bankcardPayoutMin: 0,
        bankcardPayoutMax: 0,
        wechatPayoutMin: 0,
        wechatPayoutMax: 0,
        aliPayoutMin: 0,
        aliPayoutMax: 0,
        bankcardPayoutDaily: 0,
        wechatPayoutDaily: 0,
        aliPayoutDaily: 0,
        lowestCommission: 0,
        makerMax: 0,
        makerMin: 0,
      );
    }
  }
}

final otcProvider = StateNotifierProvider<OtcNotifier, OtcModel>((ref) {
  return OtcNotifier();
});
