import 'package:flutter/material.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class WithdrawalCounter extends StatelessWidget {
  const WithdrawalCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("0.00 USDT 可用 ，2000 USDT 24小时提币额度"),
        const Gap.small(),
        Text(
          "到账数量：11.71 USDT",
          style: Font.x2largeBold,
        ),
        Text("1.00 USDT网络费用"),
        const Gap.small(),
        UiButton(
          size: UiButtonSize.medium,
          minWidth: 300,
          onPressed: () {},
          label: "提币",
        ),
      ],
    );
  }
}
