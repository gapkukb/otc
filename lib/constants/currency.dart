import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otc/asstes/assets.gen.dart';

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
  USDT(name: "USDT", enable: false),
  BTC(name: "BTC", enable: false),
  ETH(name: "ETH", enable: false),
  USDC(name: "USDC", enable: false),
  BNB(name: "BNB", enable: false),
  XRP(name: "XRP", enable: false),
  ADA(name: "ADA", enable: false),
  DOGE(name: "DOGE", enable: false),
  SOL(name: "SOL", enable: false),
  MATIC(name: "MATI", enable: false),
  TRX(name: "TRX", enable: false),
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

  static get enabled {
    return values.where((element) => element.enable);
  }
}
