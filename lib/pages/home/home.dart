import 'package:flutter/material.dart';
import 'package:otc/layout/layout.footer.dart';
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
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1242),
            child: const Column(
              children: [
                HomeTop(),
                HomeMarqueer(),
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
                SizedBox(height: 185),
                HomeServices(),
                SizedBox(height: 196),
                HomeAdvantage(),
                SizedBox(height: 96),
                LayoutFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
