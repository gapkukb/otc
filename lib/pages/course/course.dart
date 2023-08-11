import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/theme/padding.dart';

class Course extends StatelessWidget {
  const Course({super.key});

  static final List<List<Map<String, dynamic>>> items = [
    [
      {
        "title": "XXX平台是免手续费的在线市场，面向加密货币买卖双方寻求感兴趣的交易者",
        "image": Assets.images.course1.image(),
      },
      {
        "title": "无需第三方中介机构，各方可直接联系交易",
        "image": Assets.images.course2.image(),
      }
    ],
    [
      {
        "title": "买家可在市场中找到最优报价，然后通过卖家提供的支付方式付款",
        "image": Assets.images.course3.image(),
      },
      {
        "title": "下一步，在订单到期前点击“已付”按钮，等待加密货币于几分钟内到账。",
        "image": Assets.images.course4.image(),
      }
    ],
    [
      {
        "title": "卖家确认个人银行账户/数字钱包收到付款后，再向买家放行加密货币。",
        "image": Assets.images.course5.image(),
      },
      {
        "title": "如在下单时遇到问题，请提交申诉，我们的客服团队将在24小时内解决问题。",
        "image": Assets.images.course6.image(),
      }
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("如何使用C2C"),
      ),
      body: Padding(
        padding: Pads.md,
        child: ListView.separated(
          separatorBuilder: (context, index) => const Gap.medium(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Wrap(
              spacing: 64,
              runAlignment: WrapAlignment.center,
              children: item.map((sub) {
                return SizedBox(
                  width: 282,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sub['title']),
                      sub['image'],
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
