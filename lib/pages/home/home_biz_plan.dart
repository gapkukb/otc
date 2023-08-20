import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/row_gap/row_gap.dart';
import 'package:otc/router/router.dart';
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
          "Maoerduo做市商扶持计划",
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
            iconData: Icons.keyboard_arrow_right,
            label: "加入做市商联盟",
            iconOnRight: true,
            minWidth: 180,
            onPressed: () {
              context.go(Routes.merchant);
            },
          ),
        ),
        const SizedBox(height: 96),
        swiper(),
      ],
    );
  }

  swiper() {
    const List<Map<String, dynamic>> items = [
      {
        "icon": Icons.attractions_outlined,
        "title": "0手续费发广告",
        "description": "Maoerduo在全球开展商户扶植计划，支持0手续费发布购买或出售广告。",
      },
      {
        "icon": Icons.show_chart,
        "title": "佣金收益",
        "description": "每完成一笔订单，做市商都会获得一次返佣奖励。",
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
      child: RowGap(
        spacing: 98,
        items: items.map(
          (item) {
            return Expanded(
              child: HomeBizPlanSwiperItem(
                icon: item['icon'],
                title: item['title'],
                description: item['description'],
              ),
            );
          },
        ).toList(),
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

  _switch(_) {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _switch,
      onExit: _switch,
      child: Material(
        color: isActive ? const Color(0xffEAF0FF) : Colors.white,
        shape: isActive
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                side: BorderSide(
                  color: Color(0xff97B2F9),
                ),
              )
            : null,
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
