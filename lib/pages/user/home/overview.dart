import 'package:flutter/material.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:intl/intl.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<dynamic> _items = [
    {"label": "账户余额", "value": 89935.015, "unit": "USDT"},
    {"label": "可用余额", "value": 89935, "unit": "USDT"},
    {"label": "冻结余额", "value": 89935, "unit": "USDT"},
  ];

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: context.responsive(
        Axis.vertical,
        lg: Axis.horizontal,
      ),
      children: _items.map(item).toList()
        ..add(_buildItem(
          ListTile(
            title: UiButton(
              size: UiButtonSize.medium,
              label: "充值",
              onPressed: () {},
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: UiButton(
                variant: UiButtonVariant.outline,
                size: UiButtonSize.medium,
                label: "提现",
                onPressed: () {},
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
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.grey),
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
