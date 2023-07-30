import 'package:flutter_svg/flutter_svg.dart';

enum FiatCurrency {
  CNY(text: "人民币", symbol: "￥"),
  USD(text: "美元", symbol: "\$"),
  CAD(text: "加币", symbol: "C\$"),
  GBP(text: "英镑", symbol: "£"),
  JPY(text: "日元", symbol: "¥"),
  AUD(text: "澳元", symbol: "AUD"),
  EUR(text: "欧元", symbol: "€"),
  PHP(text: "披索", symbol: "₱"),
  SGD(text: "新币", symbol: "S\$"),
  MYR(text: "马币", symbol: "RM"),
  ;

  const FiatCurrency({
    required this.symbol,
    required this.text,
  });

  final String text;
  final String symbol;
}

enum Cryptocurrency {
  USDT(name: "USDT"),
  ETH(name: "ETH"),
  TRX(name: "TRX"),
  BNB(name: "BNB"),
  BTC(name: "BTC"),
  USDC(name: "USDC"),
  XRP(name: "XRP"),
  ADA(name: "ADA"),
  DOGE(name: "DOGE"),
  SOL(name: "SOL"),
  MATI(name: "MATI"),
  LTC(name: "LTC"),
  DOT(name: "DOT"),
  AVAX(name: "AVAX"),
  DAI(name: "DAI");

  const Cryptocurrency({
    required this.name,
  });

  final String name;

  String get iconPath {
    return "assets/coins/${name.toLowerCase()}.svg";
  }

  SvgPicture get icon {
    return SvgPicture.asset(iconPath);
  }

  static Cryptocurrency? getByName(String name) {
    return Cryptocurrency.values.firstWhere((element) => element.name == name);
  }
}
