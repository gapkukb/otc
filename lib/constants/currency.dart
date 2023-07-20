import 'package:flutter_svg/flutter_svg.dart';

enum Fiatcurrency {
  CNY,
  USD,
}

enum Cryptocurrency {
  USDT,
  TRX,
  BNB,
  ETH,
}

enum Coin {
  USDT(name: "USDT", enable: true),
  ETH(name: "ETH", enable: true),
  TRX(name: "TRX", enable: true),
  BNB(name: "BNB", enable: true),
  BTC(name: "BTC", enable: false),
  USDC(name: "USDC", enable: false),
  XRP(name: "XRP", enable: false),
  ADA(name: "ADA", enable: false),
  DOGE(name: "DOGE", enable: false),
  SOL(name: "SOL", enable: false),
  MATIC(name: "MATI", enable: false),
  LTC(name: "LTC", enable: false),
  DOT(name: "DOT", enable: false),
  AVAX(name: "AVAX", enable: false),
  DAI(name: "DAI", enable: false);

  const Coin({
    required this.name,
    required this.enable,
  });

  final String name;
  final bool enable;

  String get iconPath {
    return "assets/coins/${name.toLowerCase()}.svg";
  }

  SvgPicture get icon {
    return SvgPicture.asset(iconPath);
  }

  static List<Coin> get enabled {
    return values.where((element) => element.enable).toList();
  }
}
