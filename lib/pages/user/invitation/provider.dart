import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'model.dart';

final userInvitationProvider = FutureProvider.family<PaginationModel<UserInvitationModel>, Map<String, dynamic>>((ref, filters) async {
  return await Future.value(PaginationModel(
    size: 10,
    current: 1,
    pages: 10,
    total: 10,
    records: [],
  ));
});
