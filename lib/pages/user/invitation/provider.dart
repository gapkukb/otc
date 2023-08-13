import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'model.dart';

final userInvitationProvider = FutureProvider.family<PaginationModel<UserInvitationModel>, Map<String, dynamic>>((ref, filters) async {
  final data = await apis.user.commissionInvcode(filters);
  return data;
});
