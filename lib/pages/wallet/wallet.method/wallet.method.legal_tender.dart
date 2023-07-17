import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.addition.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.webchat_and_alipay.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.bank.dart';
import 'package:dropdown_search/dropdown_search.dart';

class WalletAddressLegalTender extends StatefulWidget {
  const WalletAddressLegalTender({super.key});

  @override
  State<WalletAddressLegalTender> createState() =>
      _WalletAddressLegalTenderState();
}

class _WalletAddressLegalTenderState extends State<WalletAddressLegalTender> {
  static List<dynamic> items = [
    {
      "label": "银行卡",
      "path": AddType.bank,
    },
    {
      "label": "支付宝",
      "path": AddType.alipay,
    },
    {
      "label": "微信",
      "path": AddType.wechat,
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
                        tabs: itemsLabel.map((e) => Text(e)).toList(),
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      SizedBox(
                        width: 160,
                        child: DropdownSearch<String>(
                          dropdownBuilder: (context, selectedItem) {
                            return const Text("收款方式");
                          },
                          popupProps: PopupProps.menu(
                            fit: FlexFit.loose,
                            menuProps: MenuProps(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                          items: itemsLabel,
                          dropdownButtonProps: const DropdownButtonProps(
                            isVisible: false,
                            alignment: Alignment.topLeft,
                          ),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              icon: Icon(Icons.add),
                              border: InputBorder.none,
                            ),
                          ),
                          onChanged: (value) {
                            context.push(
                              '/wallet_addition',
                              extra: items.firstWhere((element) {
                                return element['label'] == value;
                              })!['path'],
                            );
                            // Modal.confirm(
                            //   title: "交易资格",
                            //   content: "您必须完成至少KYC1级别的身份认证才能开启收款方式功能。",
                            //   okText: "去认证",
                            //   onOk: () {
                            //     // context.push('/');
                            //   },
                            // );
                          },
                          selectedItem: "Brazil",
                        ),
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
                        WalletAddressBank(),
                        WalletAddressWechatAndAlipay(
                          addType: AddType.alipay,
                        ),
                        WalletAddressWechatAndAlipay(
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
