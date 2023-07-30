import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/providers/wallet.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';

class Overview extends ConsumerWidget {
  const Overview({super.key});

  @override
  Widget build(context, ref) {
    final stats = ref.watch(balanceProvider);
    final List<dynamic> items = [
      {"label": "账户余额", "value": stats.balance, "unit": "USDT"},
      {"label": "可用余额", "value": stats.valid, "unit": "USDT"},
      {"label": "冻结余额", "value": stats.freezed, "unit": "USDT"},
    ];
    return Flex(
      direction: context.responsive(
        Axis.vertical,
        lg: Axis.horizontal,
      ),
      children: items.map(item).toList()
        ..add(_buildItem(
          ListTile(
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
                label: "提现",
                onPressed: () {
                  context.push(Routes.withdrawal);
                },
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
        title: Text(
          (item['value'] as num).decimalize(),
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
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
              item['unit'] ?? "USDT",
              // style: Theme.of(context)
              //     .textTheme
              //     .bodySmall!
              //     .copyWith(color: Colors.grey),
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
