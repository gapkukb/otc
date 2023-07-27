import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

enum Coins {
  USDT(
    name: "USDT",
  ),
  ETH(
    name: "ETH",
  ),
  TRX(
    name: "TRX",
  ),
  BNB(
    name: "BNB",
  ),
  BTC(
    name: "BTC",
  ),
  USDC(
    name: "USDC",
  ),
  XRP(
    name: "XRP",
  ),
  ADA(
    name: "ADA",
  ),
  DOGE(
    name: "DOGE",
  ),
  SOL(
    name: "SOL",
  ),
  MATIC(
    name: "MATI",
  ),
  LTC(
    name: "LTC",
  ),
  DOT(
    name: "DOT",
  ),
  AVAX(
    name: "AVAX",
  ),
  DAI(
    name: "DAI",
  );

  const Coins({
    required this.name,
  });

  final String name;

  String get iconPath {
    return "assets/coins/${name.toLowerCase()}.svg";
  }

  SvgPicture get icon {
    return SvgPicture.asset(iconPath);
  }

  static Coins? getByName(String name) {
    return Coins.values.firstWhere((element) => element.name == name);
  }
}
