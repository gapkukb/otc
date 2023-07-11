import 'package:flutter/material.dart';
import 'package:otc/pages/home/home_advantage.dart';
import 'package:otc/pages/home/home_carousel.dart';
import 'package:otc/pages/home/home_market.dart';
import 'package:otc/pages/home/home_biz_plan.dart';
import 'package:otc/pages/home/home_marqueer.dart';
import 'package:otc/pages/home/home_services.dart';
import 'package:otc/pages/home/home_top.dart';
import 'package:otc/theme/text_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        HomeTop(),
        HomeMarqueer(),
        SizedBox(
          height: 58,
        ),
        SizedBox(height: 16),
        HomeCarousel(),
        SizedBox(height: 56),
        Text(
          "市场",
          style: Font.x6largeBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32),
        HomeMarket(),
        SizedBox(height: 16),
        HomeBizPlan(),
        SizedBox(height: 96),
        HomeServices(),
        SizedBox(height: 96),
        SizedBox(height: 16),
        HomeAdvantage(),
      ],
    );
  }
}
