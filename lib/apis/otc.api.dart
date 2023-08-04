part of apis;

class _OTCApi {
  final stat30days = get("/otc/customer-stat/30days");
  final getCoins = get("/otc/coin/support");
  final rate = get("/otc/rate/{from}/{to}");
  final qrcode = post<List<Map<String, dynamic>>>("/otc/qrcode");
  final bankcard = post<List<Map<String, dynamic>>>("/otc/bankcard");

  /// 获取支持的币种
  final supportedCoins = post("/otc/coin/support");

  /// 获取支持的网络
  final supportedBlockchain = post("/otc/blockchain/support");

  /// 查询当前用户佣金比例
  final getCommissionRate = get("/commission/rate");

  /// 佣金明细
  final commissionDeals = post("/commission/deals/page");

  /// 邀请明细
  final commissionInvPage = post("/commission/inv-detail/page");

  /// 佣金总览
  final commissionOverview = post("/commission/overview");

  /// 我的广告

  final myAdvertise = post("/otc/record/advertise", (Map<String, dynamic> json) {
    return PaginationModel.fromJson(json, (item) => AdMyModel.fromJson(item as dynamic));
  }, HttpOptions(loading: false));
}

final otcApi = _OTCApi();
