import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'package:otc/pages/merchant/income/model.dart';

final rebateDetailProvider = FutureProvider.autoDispose.family<PaginationModel<MerchantIncomeModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.otc.commissionDeals(filters);
});
