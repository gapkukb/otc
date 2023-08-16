part of ad_own;

final adOwnProvider = FutureProvider.family.autoDispose<PaginationModel<AdMyModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.otc.myAdvertise(filters);
});
