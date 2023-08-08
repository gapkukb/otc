import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/providers/otc.provider.dart';

class RebateProportion extends ConsumerWidget {
  const RebateProportion({super.key});

  @override
  Widget build(context, ref) {
    final otc = ref.read(otcProvider);
    final List<Map<String, dynamic>> items = [
      {
        "label": "银行卡佣金比例",
        "value": "${otc.bankcardReceiptMin}%",
      },
      {
        "label": "支付宝佣金比例",
        "value": "${otc.aliReceiptMin}%",
      },
      {
        "label": "微信佣金比例",
        "value": "${otc.wechatReceiptMin}%",
      }
    ];
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
