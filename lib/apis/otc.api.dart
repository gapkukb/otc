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
}

final otcApi = _OTCApi();
