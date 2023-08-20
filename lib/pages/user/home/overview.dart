import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/predication.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';

class Overview extends ConsumerWidget {
  const Overview({super.key});

  @override
  Widget build(context, ref) {
    final stats = ref.watch(balanceProvider);
    final List<dynamic> items = [
      {"label": "账户余额", "value": stats.balance, "unit": "USD"},
      {"label": "可用余额", "value": stats.valid, "unit": "USD"},
      {"label": "冻结余额", "value": stats.freezed, "unit": "USD"},
    ];
    return Flex(
      direction: context.responsive(
        Axis.vertical,
        lg: Axis.horizontal,
      ),
      children: items.map(item).toList()
        ..add(_buildItem(
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: UiButton(
                size: UiButtonSize.medium,
                label: "充值",
                onPressed: () {
                  context.push(Routes.recharge);
                },
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: UiButton(
                  variant: UiButtonVariant.outline,
                  size: UiButtonSize.medium,
                  label: "提币",
                  onPressed: () async {
                    if (await predication(types: [
                      Predication.phone,
                      Predication.kyc1,
                      Predication.funds,
                    ])) {
                      context.push(Routes.withdrawal);
                    }
                  },
                ),
              ),
            ),
          ),
        )),
    );
  }

  Widget item(dynamic item) {
    return _buildItem(
      ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        minVerticalPadding: 0,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            (item['value'] as num).decimalize(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['label'],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item['unit'] ?? "USD",
              style: const TextStyle(color: Color(0xff7c8db5)),
            ),
          ],
        ),
      ),
    );
  }

  _buildItem(Widget child) {
    return Expanded(
      child: SizedBox(
        height: 144,
        child: Card(
          child: child,
        ),
      ),
    );
  }
}
