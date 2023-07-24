part of apis;

class _OTCApi {
  final stat30days = get("/otc/customer-stat/30days");
}

final otcApi = _OTCApi();
