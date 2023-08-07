import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/pages/merchant/setting/provider.dart';
import 'package:otc/pages/merchant/setting/setting.slider.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_number_stepper.dart';

class MerchantSetting extends StatefulWidget {
  const MerchantSetting({super.key});

  @override
  State<MerchantSetting> createState() => _MerchantSettingState();
}

class _MerchantSettingState extends State<MerchantSetting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Pads.lg,
        child: ListView(
          children: [
            const Text("以银行卡为例："),
            const Gap.mini(),
            const Text("若整条线的利润为5.00%，做市商的固定收益为2.00%，总代有3%的利润可分配给下级"),
            const Gap.mini(),
            const Text(
              "佣金比例可能会根据时段有不同的调整，详情请关注公告。",
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
            const Divider(
              height: 49,
              thickness: 0.5,
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
                    return Column(
                      children: [
                        Block(
                          groupName: "总代佣金比例",
                          items: [
                            _Item(
                              channel: PaymentMethods.bankCard,
                              max: data.bankcardMakerRate,
                              value: data.bankCardLv1,
                              name: "银行卡",
                            ),
                            _Item(
                              channel: PaymentMethods.alipay,
                              max: data.alipayMakerRate,
                              value: data.alipayLv1,
                              name: "支付宝",
                            ),
                            _Item(
                              channel: PaymentMethods.wechat,
                              max: data.wechatMakerRate,
                              value: data.wechatLv1,
                              name: "微信",
                            ),
                          ],
                        ),
                        Block(
                          groupName: "1代佣金比例",
                          items: [
                            _Item(
                              channel: PaymentMethods.bankCard,
                              max: data.bankcardMakerRate,
                              value: data.bankCardLv2,
                              name: "银行卡",
                            ),
                            _Item(
                              channel: PaymentMethods.alipay,
                              max: data.alipayMakerRate,
                              value: data.alipayLv2,
                              name: "支付宝",
                            ),
                            _Item(
                              channel: PaymentMethods.wechat,
                              max: data.wechatMakerRate,
                              value: data.wechatLv2,
                              name: "微信",
                            ),
                          ],
                        ),
                        Block(
                          groupName: "2代佣金比例",
                          items: [
                            _Item(
                              channel: PaymentMethods.bankCard,
                              max: data.bankcardMakerRate,
                              value: data.bankCardLv3,
                              name: "银行卡",
                            ),
                            _Item(
                              channel: PaymentMethods.alipay,
                              max: data.alipayMakerRate,
                              value: data.alipayLv3,
                              name: "支付宝",
                            ),
                            _Item(
                              channel: PaymentMethods.wechat,
                              max: data.wechatMakerRate,
                              value: data.wechatLv3,
                              name: "微信",
                            ),
                          ],
                        ),
                        Block(
                          groupName: "做市商",
                          items: [
                            _Item(
                              channel: PaymentMethods.bankCard,
                              max: data.bankcardMakerRate,
                              value: data.bankCardLv4,
                              name: "银行卡",
                              disabled: true,
                            ),
                            _Item(
                              channel: PaymentMethods.alipay,
                              max: data.alipayMakerRate,
                              value: data.alipayLv4,
                              name: "支付宝",
                              disabled: true,
                            ),
                            _Item(
                              channel: PaymentMethods.wechat,
                              max: data.wechatMakerRate,
                              value: data.wechatLv4,
                              name: "微信",
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
    );
  }
}

class _Item {
  final PaymentMethods channel;
  final double max;
  final double value;
  final String name;
  final bool? disabled;

  const _Item({
    required this.channel,
    required this.max,
    required this.value,
    required this.name,
    this.disabled,
  });
}

class Block extends StatelessWidget {
  final String groupName;
  final List<_Item> items;
  const Block({
    super.key,
    required this.groupName,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      child: Padding(
        padding: Pads.sm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BlockTitle(title: groupName),
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
                    Text(item.name),
                    const Gap.small(),
                    UiNumberStepper(
                      disabeld: item.disabled ?? false,
                      isDense: true,
                      unit: " %",
                      min: 0,
                      max: item.max,
                      step: 0.01,
                      onChange: (newValue) {},
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
