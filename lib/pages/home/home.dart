import 'package:flutter/material.dart';
import 'package:otc/pages/home/home_advantage.dart';
import 'package:otc/pages/home/home_carousel.dart';
import 'package:otc/pages/home/home_market.dart';
import 'package:otc/pages/home/home_biz_plan.dart';
import 'package:otc/pages/home/home_marqueer.dart';
import 'package:otc/pages/home/home_services.dart';
import 'package:otc/pages/home/home_top.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
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
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
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
      ),
    );
  }
}
