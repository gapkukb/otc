import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otc/asstes/assets.gen.dart';

enum Fiatcurrency {
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

  const Fiatcurrency({
    required this.symbol,
    required this.text,
  });

  final String text;
  final String symbol;

  static Fiatcurrency? getByName(String name) {
    return Fiatcurrency.values.firstWhere((element) => element.name == name);
  }
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
  MATIC(name: "MATIC"),
  LTC(name: "LTC"),
  DOT(name: "DOT"),
  AVAX(name: "AVAX"),
  DAI(name: "DAI");

  const Cryptocurrency({
    required this.name,
  });

  final String name;

  String get iconPath {
    return "assets/coins/${name.toLowerCase()}.png";
  }

  Image get icon {
    return Image.asset(
      iconPath,
      width: 24,
      height: 24,
    );
  }

  static Cryptocurrency? getByName(String name) {
    return Cryptocurrency.values.firstWhere((element) => element.name == name);
  }
}
