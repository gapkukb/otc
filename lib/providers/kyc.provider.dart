import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/models/kyc/kyc.model.dart';
import 'package:otc/models/otc/otc.model.dart';

const faker = KycModel(
  username: "",
  reference: "",
  identity: "",
  used: false,
  idFrontPicture: "",
  idBackPicture: "",
  idHoldPicture: "",
  idHoldVideo: "",
  lv1Status: KycStatus.pending,
  lv2Status: KycStatus.pending,
  lv3Status: KycStatus.pending,
);

// const faker2 = OtcModel(
//   enabled: enabled,
//   kycLevel: kycLevel,
//   bankcardReceiptMin: bankcardReceiptMin,
//   bankcardReceiptMax: bankcardReceiptMax,
//   bankcardReceiptDaily: bankcardReceiptDaily,
//   wechatReceiptMin: wechatReceiptMin,
//   wechatReceiptMax: wechatReceiptMax,
//   wechatReceiptDaily: wechatReceiptDaily,
//   aliReceiptMin: aliReceiptMin,
//   aliReceiptMax: aliReceiptMax,
//   aliReceiptDaily: aliReceiptDaily,
//   bankcardPayoutMin: bankcardPayoutMin,
//   bankcardPayoutMax: bankcardPayoutMax,
//   wechatPayoutMin: wechatPayoutMin,
//   wechatPayoutMax: wechatPayoutMax,
//   aliPayoutMin: aliPayoutMin,
//   aliPayoutMax: aliPayoutMax,
//   bankcardPayoutDaily: bankcardPayoutDaily,
//   wechatPayoutDaily: wechatPayoutDaily,
//   aliPayoutDaily: aliPayoutDaily,
//   lowestCommission: lowestCommission,
// );

class KycNotifier extends StateNotifier<KycModel> {
  KycNotifier() : super(faker);
}

final kycProvider = StateNotifierProvider<KycNotifier, KycModel>((ref) {
  return KycNotifier();
});
