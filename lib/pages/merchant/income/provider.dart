import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'package:otc/pages/merchant/dashboard/model.dart';
import 'package:otc/pages/merchant/income/model.dart';

// class MerchantIncomeNotifier extends StateNotifier<MerchantDashboradModel> {
//   final Map<String, dynamic> filters;
//   MerchantIncomeNotifier(this.filters) : super(MerchantDashboradModel()) {
//     update();
//   }

//   Future<MerchantDashboradModel> update() async {
//     final json = await apis.otc.commissionDeals(filters);

//     state = MerchantDashboradModel.fromJson(json);
//     return state;
//   }
// }

final merchantIncomeProvider = FutureProvider.family<PaginationModel<MerchantIncomeModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.otc.commissionDeals(filters);
});
