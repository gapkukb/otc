import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class HomeServices extends StatefulWidget {
  const HomeServices({super.key});

  @override
  State<HomeServices> createState() => _HomeServicesState();
}

class _HomeServicesState extends State<HomeServices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "核心服务",
          style: Font.x6largeBold,
        ),
        const Text(
          "你可以选择丰富的交易方式",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 96),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: collection()),
            Image.asset(
              "assets/images/image 5.png",
              cacheWidth: 505,
            )
          ],
        ),
      ],
    );
  }

  final List<Map<String, String>> items = [
    {
      "title": "交易手续费",
      "description": "你可以方便快捷地交易比特币等数字货币，买卖双方无需支付交易手续费。",
    },
    {
      "title": "安全稳定",
      "description":
          "Mybit C2C采用T+1提现机制，对商家严格管理，风控大数据筛选排查可疑交易，确保平台资金安全，用户能安全交易。",
    },
    {
      "title": "佣金收益",
      "description": "业界首创，Mybit商户独享。商户每完成一笔合法的星级订单，就可以享受到佣金分成。",
    },
    {
      "title": "简单方便",
      "description": "Mybit用户友好型的界面设计让购买数字货币变得简单轻松",
    },
  ];
  item() {}
  collection() {
    return ListView.separated(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 48),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          isThreeLine: true,
          leading: Container(
            width: 40,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xff2D68FE),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100)),
            child: Text(
              (index + 1).toString().padLeft(2, '0'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item['title']!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          subtitle: Text(
            item['description']!,
            style: const TextStyle(
              color: Color(0xff666666),
            ),
          ),
        );
      },
    );
  }
}
