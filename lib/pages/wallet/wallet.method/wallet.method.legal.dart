import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.hepler.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.qrcode.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.bank.dart';
import 'package:otc/router/router.dart';

class WalletMethodLegal extends StatefulWidget {
  const WalletMethodLegal({super.key});

  @override
  State<WalletMethodLegal> createState() => _WalletMethodLegalState();
}

class _WalletMethodLegalState extends State<WalletMethodLegal> {
  static List<dynamic> items = [
    {
      "label": "银行卡",
      "path": AddType.bank,
      "action": (BuildContext context) {
        context.pushNamed(
          Routes.walletMethodBankAddition,
        );
      }
    },
    {
      "label": "支付宝",
      "path": AddType.alipay,
      "action": (BuildContext context) {
        context.pushNamed(
          Routes.walletMethodQRcodeAddition,
          extra: AddType.alipay,
        );
      }
    },
    {
      "label": "微信",
      "path": AddType.wechat,
      "action": (BuildContext context) {
        context.pushNamed(
          Routes.walletMethodQRcodeAddition,
          extra: AddType.wechat,
        );
      }
    },
  ];

  static List<String> get itemsLabel {
    return items.map((e) => e['label'] as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "您添加的银行卡将在C2C交易出售数字货币时向买方展示作为您的收款方式，请务必使用您本人的实名账户确保买方可以顺利给您转账。",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: itemsLabel.map((e) => Tab(text: e)).toList(),
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      MenuAnchor(
                        style: const MenuStyle(
                          alignment: Alignment(-0.5, 1),
                        ),
                        menuChildren: items
                            .map(
                              (e) => MenuItemButton(
                                onPressed: verify(
                                  context,
                                  () {
                                    e['action'](context);
                                  },
                                ),
                                child: Text(
                                  e['label'],
                                ),
                              ),
                            )
                            .toList(),
                        builder: (context, controller, child) {
                          return TextButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text("收款方式"),
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  const Expanded(
                    child: TabBarView(
                      // physics: NeverScrollableScrollPhysics(),
                      children: [
                        WalletMethodBank(),
                        WalletQRcode(
                          addType: AddType.alipay,
                        ),
                        WalletQRcode(
                          addType: AddType.wechat,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
