import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<dynamic> _items = [
    {"label": "账户余额", "value": 89935, "unit": "USDT"},
    {"label": "账户余额", "value": 89935, "unit": "USDT"},
    {"label": "账户余额", "value": 89935, "unit": "USDT"},
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Flex(
        direction: context.responsive(
          Axis.vertical,
          lg: Axis.horizontal,
        ),
        children: _items.map((e) => item(e)).toList()
          ..add(
            Expanded(
              child: Card(
                child: ListTile(
                  title: FilledButton(onPressed: () {}, child: Text("充值")),
                  subtitle: FilledButton(onPressed: () {}, child: Text("提现")),
                ),
              ),
            ),
          ),
      ),
    );
  }

  Widget item(dynamic item) {
    return Expanded(
      child: Card(
        child: ListTile(
          title: Text(
            item['value'].toString(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
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
              Text(
                item['unit'] ?? "USDT",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
