import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import 'package:otc/pages/home/home_advantage.dart';
import 'package:otc/pages/home/home_carousel.dart';
import 'package:otc/pages/home/home_market.dart';
import 'package:otc/pages/home/home_biz_plan.dart';
import 'package:otc/pages/home/home_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /**
          Image.asset("images/top-banner.png"),
          const SizedBox(height: 32),
          const Text(
            "开启加密货币之旅",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "在Mybit您可以安全便捷，口手续费买卖数字货币。",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xff34495E),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xff2D68FE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("查看详情"),
                SizedBox(
                  width: 8,
                  height: 48,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  // size: 24.0,
                ),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(
            height: 58,
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                const Icon(Icons.volume_up),
                Expanded(
                  child: Marqueer(
                    pps: 60,
                    direction: MarqueerDirection.rtl,
                    restartAfterInteractionDuration: const Duration(seconds: 6),
                    restartAfterInteraction: false,
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer pretium massa mollis lorem blandit imperdiet. Nulla mattis vitae mauris vel condimentum. Nam posuere, augue vitae lobortis consequat, odio ante condimentum est, at maximus augue purus id metus. Curabitur condimentum aliquet ante at aliquet. Quisque vel massa congue, bibendum leo sodales, malesuada ante. Maecenas sed tortor quis ipsum dictum sollicitudin.',
                      style: TextStyle(height: 2),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Text(
                    "查看更多",
                  ),
                  label: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 10,
                  ),
                  style: TextButton.styleFrom(),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          const HomeCarousel(),
          const SizedBox(height: 56),
          const Text(
            "市场",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          const HomeMarket(),
          const SizedBox(height: 16),
          const HomeBizPlan(),
          const SizedBox(height: 96),
          const HomeServices(),
          const SizedBox(height: 96),
          const SizedBox(height: 16),
           */

          const HomeAdvantage(),
        ],
      ),
    );
  }
}
