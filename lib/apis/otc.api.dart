part of apis;

class _OTCApi {
  final stat30days = get("/otc/customer-stat/30days");
  final getCoins = get("/otc/coin/support");
  final rate = get("/otc/rate/{from}/{to}");
  final qrcode = get<List<Map<String, dynamic>>>("/otc/qrcode");
  final bankcard = get<List<Map<String, dynamic>>>("/otc/bankcard");
}

final otcApi = _OTCApi();
