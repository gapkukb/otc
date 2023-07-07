import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_flex.dart';

class UserAgent extends StatelessWidget {
  const UserAgent({super.key});

  static List<String> items = [
    "• 完成手机号或邮箱绑定",
    "• 账户余额不低于500 USDT",
    "• 完成身份验证",
    "• 绑定一张银行卡"
  ];

  static List<dynamic> futures = [
    {
      "title": "广告发布权限",
      "desc": "广告方可以自由发布广告，买卖更灵活，更便捷。",
      "image": "assets/images/1.png"
    },
    {
      "title": "佣金收益",
      "desc": "为了让商家更好的服务用户，每完成一笔星级订单，商家都会获得一次返佣奖励。",
      "image": "assets/images/2.png"
    },
    {
      "title": "一对一服务",
      "desc": "我们针对商户提供一对一服务，提高交易效率。",
      "image": "assets/images/3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 56),
          const Text(
            "认证商户申请",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "成为Mybit认证商户，获得广告发布权限，享受更多交易特权",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),
          UiButton(
            label: "立即申请",
            size: UiButtonSize.medium,
            onPressed: () {
              Modal.confirm(
                title: "商户申请",
                content: "您的账户余额不足500 USDT，请先充值。",
                okText: "充币",
                onOk: () {},
              );
              Modal.confirm(
                title: "商户申请",
                content: "您未完成身份认证，请先认证",
                okText: "去认证",
                onOk: () {},
              );
              Modal.confirm(
                title: "商户申请",
                content: "请至少先绑定一张银行卡，银行卡户主姓名必须和身份证一致。",
                okText: "去绑卡",
                onOk: () {},
              );
              // context.go('/agent_apply');
            },
          ),
          const SizedBox(height: 48),
          Panel(
            title: "申请条件",
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Wrap(
                children: items
                    .map(
                      (e) => FractionallySizedBox(
                        widthFactor: context.responsive(1, md: 0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          UiFlex(
            children: futures.map((e) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(e['image']),
                      Text(
                        e['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        e['desc'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
