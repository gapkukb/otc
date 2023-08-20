import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/pages/merchant/dashboard/model.dart';

class MerchantDashboardNotifier extends StateNotifier<MerchantDashboradModel> {
  MerchantDashboardNotifier() : super(MerchantDashboradModel()) {
    update();
  }

  Future<MerchantDashboradModel> update() async {
    final json = await apis.merchant.getDashboard();

    state = MerchantDashboradModel.fromJson(json);
    return state;
  }
}

final dashboradProvider = StateNotifierProvider.autoDispose<MerchantDashboardNotifier, MerchantDashboradModel>((ref) {
  return MerchantDashboardNotifier();
});
