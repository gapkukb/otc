import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/models/kyc/kyc.model.dart';

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

class KycNotifier extends StateNotifier<KycModel> {
  KycNotifier() : super(faker);
}

final kycProvider = StateNotifierProvider<KycNotifier, KycModel>((ref) {
  return KycNotifier();
});
