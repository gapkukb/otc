import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomeBizPlan extends StatelessWidget {
  const HomeBizPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "XXXXXX\n做市商扶持计划",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 40,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "我们的宗旨是让所有的做市商在每一笔成功的交易中获得收益",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 48),
        SizedBox(
          height: 48,
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Text("加入商家联盟"),
            label: const Icon(
              Icons.keyboard_arrow_right,
              fill: 0,
            ),
          ),
        ),
        const SizedBox(height: 96),
        swiper(),
      ],
    );
  }

  swiperItem(
    IconData icon,
    String title,
    String description,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: Icon(
                icon,
                size: 44,
              ),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  swiperPagination() {}

  swiper() {
    const List<Map<String, dynamic>> items = [
      {
        "icon": Icons.attractions_outlined,
        "title": "0手续费发广告",
        "description": "XXX在全球开展商户扶植计划，支持0手续费发布购买或出售广告。",
      },
      {
        "icon": Icons.show_chart,
        "title": "佣金收益",
        "description": "每完成一笔星级订单，做市商都会获得一次返佣奖励。",
      },
      {
        "icon": Icons.volunteer_activism_outlined,
        "title": "24/7 客户支持",
        "description": "做市商联盟享受专属客户服务，24/7 小时全球客服为您解决订单问题。",
      },
    ];

    return SizedBox(
      height: 324,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (context, index) {
          final item = items[index];
          return swiperItem(
            item['icon'],
            item['title'],
            item['description'],
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(
          builder: RectSwiperPaginationBuilder(
            activeColor: Color(0xff6E2DFA),
            size: Size(54, 6),
            color: Color(0xffEAEAEA),
          ),
        ),
      ),
    );
  }
}
