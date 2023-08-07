import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/pages/merchant/setting/provider.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_number_stepper.dart';

Map<String, dynamic> formState = {};

class MerchantSetting extends StatefulWidget {
  const MerchantSetting({super.key});

  @override
  State<MerchantSetting> createState() => _MerchantSettingState();
}

class _MerchantSettingState extends State<MerchantSetting> {
  @override
  void initState() {
    super.initState();
    formState = {};
  }

  final formKey = GlobalKey<FormState>();

  static const bankCardLv4 = "bankCardLv4";
  static const alipayLv4 = "alipayLv4";
  static const wechatLv4 = "wechatLv4";
  static const bankCardLv3 = "bankCardLv3";
  static const alipayLv3 = "alipayLv3";
  static const wechatLv3 = "wechatLv3";
  static const bankCardLv2 = "bankCardLv2";
  static const alipayLv2 = "alipayLv2";
  static const wechatLv2 = "wechatLv2";
  static const bankCardLv1 = "bankCardLv1";
  static const alipayLv1 = "alipayLv1";
  static const wechatLv1 = "wechatLv1";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Card(
        child: Padding(
          padding: Pads.lg,
          child: ListView(
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("以银行卡为例："),
                      Gap.mini(),
                      Text("若整条线的利润为5.00%，做市商的固定收益为2.00%，总代有3%的利润可分配给下级"),
                      Gap.mini(),
                      Text(
                        "佣金比例可能会根据时段有不同的调整，详情请关注公告。",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                      Divider(
                        height: 49,
                        thickness: 0.5,
                      ),
                    ],
                  ),
                  const Spacer(),
                  UiButton(
                    onPressed: save,
                    label: "保存",
                  )
                ],
              ),
              Consumer(
                builder: (context, ref, child) {
                  final provider = ref.watch(merchantSettingProvider);
                  return provider.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (err, trace) => Text(err.toString()),
                    data: (data) {
                      final bankMax = data.bankcardTotal - data.bankcardMakerRate;
                      final alipayMax = data.alipayTotal - data.alipayMakerRate;
                      final wechatMax = data.wechatTotal - data.wechatMakerRate;

                      return Column(
                        children: [
                          Block(
                            grouptitle: "总代佣金比例",
                            items: [
                              _Item(
                                channel: PaymentMethods.bankCard,
                                max: bankMax,
                                value: data.bankCardLv1,
                                name: bankCardLv1,
                                title: "银行卡",
                              ),
                              _Item(
                                channel: PaymentMethods.alipay,
                                max: alipayMax,
                                value: data.alipayLv1,
                                name: alipayLv1,
                                title: "支付宝",
                              ),
                              _Item(
                                channel: PaymentMethods.wechat,
                                max: wechatMax,
                                value: data.wechatLv1,
                                name: wechatLv1,
                                title: "微信",
                              ),
                            ],
                          ),
                          Block(
                            grouptitle: "1代佣金比例",
                            items: [
                              _Item(
                                channel: PaymentMethods.bankCard,
                                max: bankMax,
                                value: data.bankCardLv2,
                                name: bankCardLv2,
                                title: "银行卡",
                              ),
                              _Item(
                                channel: PaymentMethods.alipay,
                                max: alipayMax,
                                value: data.alipayLv2,
                                name: alipayLv2,
                                title: "支付宝",
                              ),
                              _Item(
                                channel: PaymentMethods.wechat,
                                max: wechatMax,
                                value: data.wechatLv2,
                                name: wechatLv2,
                                title: "微信",
                              ),
                            ],
                          ),
                          Block(
                            grouptitle: "2代佣金比例",
                            items: [
                              _Item(
                                channel: PaymentMethods.bankCard,
                                max: bankMax,
                                value: data.bankCardLv3,
                                name: bankCardLv3,
                                title: "银行卡",
                              ),
                              _Item(
                                channel: PaymentMethods.alipay,
                                max: alipayMax,
                                value: data.alipayLv3,
                                name: alipayLv3,
                                title: "支付宝",
                              ),
                              _Item(
                                channel: PaymentMethods.wechat,
                                max: wechatMax,
                                value: data.wechatLv3,
                                name: wechatLv3,
                                title: "微信",
                              ),
                            ],
                          ),
                          Block(
                            grouptitle: "做市商",
                            items: [
                              _Item(
                                channel: PaymentMethods.bankCard,
                                max: bankMax,
                                value: data.bankCardLv4,
                                name: bankCardLv4,
                                title: "银行卡",
                                disabled: true,
                              ),
                              _Item(
                                channel: PaymentMethods.alipay,
                                max: alipayMax,
                                value: data.alipayLv4,
                                name: alipayLv4,
                                title: "支付宝",
                                disabled: true,
                              ),
                              _Item(
                                channel: PaymentMethods.wechat,
                                max: wechatMax,
                                value: data.wechatLv4,
                                name: wechatLv4,
                                title: "微信",
                                disabled: true,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  save() async {
    formKey.currentState!.save();
    await apis.merchant.updateSetting({
      "list": [
        {
          "method": PaymentMethods.bankCard.value,
          "lv1": formState[bankCardLv1] / 100,
          "lv2": formState[bankCardLv2] / 100,
          "lv3": formState[bankCardLv3] / 100,
          "lv4": formState[bankCardLv4] / 100,
        },
        {
          "method": PaymentMethods.wechat.value,
          "lv1": formState[wechatLv1] / 100,
          "lv2": formState[wechatLv2] / 100,
          "lv3": formState[wechatLv3] / 100,
          "lv4": formState[wechatLv4] / 100,
        },
        {
          "method": PaymentMethods.alipay.value,
          "lv1": formState[alipayLv1] / 100,
          "lv2": formState[alipayLv2] / 100,
          "lv3": formState[alipayLv3] / 100,
          "lv4": formState[alipayLv4] / 100,
        },
      ],
    });

    Modal.showText(text: "保存成功！");
  }
}

class _Item {
  final PaymentMethods channel;
  final double max;
  final double value;
  final String title;
  final String name;
  final bool? disabled;

  const _Item({
    required this.channel,
    required this.max,
    required this.value,
    required this.title,
    required this.name,
    this.disabled,
  });
}

class Block extends StatelessWidget {
  final String grouptitle;
  final List<_Item> items;
  const Block({
    super.key,
    required this.grouptitle,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50.withOpacity(0.3),
      child: Padding(
        padding: Pads.sm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BlockTitle(title: grouptitle),
            const Gap.small(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                height: 100,
                crossAxisCount: 3,
                crossAxisSpacing: 32,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(item.title),
                    const Gap.small(),
                    UiNumberStepper(
                      disabeld: item.disabled ?? false,
                      isDense: true,
                      unit: " %",
                      min: 0,
                      max: item.max * 100,
                      step: 0.01,
                      initValue: item.value * 100,
                      formState: formState,
                      name: item.name,
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BlockTitle extends StatelessWidget {
  final String title;
  const _BlockTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Theme.of(context).primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: const SizedBox(
            width: 4,
            height: 18,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title)
      ],
    );
  }
}
