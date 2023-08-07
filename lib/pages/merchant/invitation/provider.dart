import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'model.dart';

final merchantInvitationProvider = FutureProvider.family<PaginationModel<MerchantInvitationModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.merchant.getInvitionCode(filters);
});
