import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/mix_text/mix_text.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/global/global.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';

class WithdrawalOrder extends StatelessWidget {
  final Map<String, dynamic> formState;
  const WithdrawalOrder({
    super.key,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "钱包",
      title: "确认提币订单",
      iconData: Icons.wallet,
      filledButton: true,
      onCompelete: (context) async {
        context.pop(true);
      },
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          padding: Pads.sm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("您将收到", style: Font.smallGrey),
              const Gap.mini(),
              MixText(
                child: (double.parse(formState['amount']) - formState['fee']).toString(),
                style: Font.x2largeBold,
                small: " USDT",
              ),
            ],
          ),
        ),
        const Gap.small(),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              width: 1,
              color: Colors.grey.shade200,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                cell("地址", formState['wallet']),
                cell("转账网络", formState['blockchain']),
                cell("提现来源账户", "资金钱包"),
                cell("币种", formState['currency']),
                cell("总额", "${formState['amount']} USDT"),
                cell("网络手续费", "${formState['fee']} USDT"),
              ],
            ),
          ),
        ),
        const Gap.small(),
        const Text(
          "请确保您输入了正确的提币地址并且您选择的转账网络与地址相匹配。提币订单创建后不可取消。",
          style: Font.miniGrey,
        )
      ],
    );
  }

  Widget cell(String left, String right) {
    return Padding(
      padding: Pads.yAxisXs,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          Text(
            right,
            style: Font.miniGrey,
          ),
        ],
      ),
    );
  }
}
