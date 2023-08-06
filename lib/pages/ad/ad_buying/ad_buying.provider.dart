import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/ad.all/ad.all.model.dart';
import 'package:otc/models/pagination/pagination.model.dart';

final adBuyingProvider = FutureProvider.autoDispose.family<PaginationModel<AdAllModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.otc.allAdvertise(filters);
});
