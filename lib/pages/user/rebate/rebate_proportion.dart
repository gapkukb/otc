import 'package:flutter/material.dart';
import 'package:otc/theme/theme.dart';

class RebateProportion extends StatelessWidget {
  const RebateProportion({super.key});

  static List<Map<String, dynamic>> items = [
    {
      "label": "银行卡佣金比例",
      "value": "3.00%",
    },
    {
      "label": "支付宝佣金比例",
      "value": "3.00%",
    },
    {
      "label": "微信佣金比例",
      "value": "3.00%",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Row(
          children: items.map((e) => _buildItem(context, e)).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Map<String, dynamic> item) {
    return Expanded(
      child: Row(
        children: [
          Text(
            item['label'],
            style: const TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              item['value'],
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}
