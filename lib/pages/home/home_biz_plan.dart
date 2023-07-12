import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class HomeBizPlan extends StatelessWidget {
  const HomeBizPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 148),
        const Text(
          "XXXXXX做市商扶持计划",
          textAlign: TextAlign.center,
          style: Font.x6largeBold,
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
          child: UiButton(
            shape: UiButtonShape.rounded,
            onPressed: () {},
            iconData: Icons.keyboard_arrow_right,
            label: "加入商家联盟",
            iconOnRight: true,
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
      elevation: 10,
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
          return HomeBizPlanSwiperItem(
            icon: item['icon'],
            title: item['title'],
            description: item['description'],
          );
        },

        itemCount: 3,
        // 区分pc 移动
        viewportFraction: 0.33333,
        physics: const NeverScrollableScrollPhysics(),
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

class HomeBizPlanSwiperItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const HomeBizPlanSwiperItem({
    super.key,
    required this.icon,
    required this.description,
    required this.title,
  });

  @override
  State<HomeBizPlanSwiperItem> createState() => _HomeBizPlanSwiperItemState();
}

class _HomeBizPlanSwiperItemState extends State<HomeBizPlanSwiperItem> {
  bool isActive = false;

  _switch(PointerEvent event) {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _switch,
      onExit: _switch,
      child: Card(
        elevation: 4,
        color: isActive ? const Color(0xff97B2F9) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
                child: Icon(
                  widget.icon,
                  size: 44,
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
