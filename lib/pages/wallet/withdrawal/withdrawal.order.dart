import 'package:flutter/material.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/mix_text/mix_text.dart';
import 'package:otc/components/modal/modal.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/navigator.dart';

class WithdrawalOrder extends StatefulWidget {
  const WithdrawalOrder({super.key});

  @override
  State<WithdrawalOrder> createState() => _WithdrawalOrderState();
}

class _WithdrawalOrderState extends State<WithdrawalOrder> {
  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      legend: "提币",
      title: "确认订单",
      onCompelete: (context) async {
        // 提币异常3 - 没有开启资金密码时
        Modal.confirm(
          content: "您必须开启资金密码后才可以使用提币功能。",
          okButtonText: "去开启",
          onOk: () {},
        );

        await openCaptchaWindow(
          legend: "安全验证",
          context: context,
          service: CaptchaServiceType.funds,
        );
      },
      children: [
        Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          padding: Pads.sm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("您将收到", style: Font.smallGrey),
              Gap.mini(),
              MixText(
                child: "65,000.87",
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
                cell("地址", "TEp58AYTTvVFkhrRb2ae9GDRVwg7jopomC"),
                cell("转账网络", "TRC20"),
                cell("提现来源账户", "资金钱包"),
                cell("币种", "USDT"),
                cell("总额", "65,001.87 USDT"),
                cell("网络手续费", "5 USDT"),
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
