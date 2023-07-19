import 'package:flutter/material.dart';
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

enum CurrencyCollection {
  USDT(name: "USDT", icon: const AssetImage(""));
  // BTC(name: "BTC", icon: Icons.abc),
  // ETH(name: "ETH", icon: Icons.abc),
  // USDC(name: "USDC", icon: Icons.abc),
  // BNB(name: "BNB", icon: Icons.abc),
  // XRP(name: "XRP", icon: Icons.abc),
  // ADA(name: "ADA", icon: Icons.abc),
  // DOGE(name: "DOGE", icon: Icons.abc),
  // SOL(name: "SOL", icon: Icons.abc),
  // MATIC(name: "MATI", icon: Icons.abc),
  // TRX(name: "TRX", icon: Icons.abc),
  // LTC(name: "LTC", icon: Icons.abc),
  // DOT(name: "DOT", icon: Icons.abc),
  // AVAX(name: "AVAX", icon: Icons.abc),
  // DAI(name: "DAI", icon: Icons.abc);

  const CurrencyCollection({
    required this.name,
    required this.icon,
  });

  final String name;
  final ImageProvider icon;
}
