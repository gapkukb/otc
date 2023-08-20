import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/pages/user/rebate/rebate.provider.dart';

class RebateProportion extends ConsumerWidget {
  const RebateProportion({super.key});

  @override
  Widget build(context, ref) {
    final rabate = ref.watch(rabateProvider);
    final List<Map<String, dynamic>> items = [
      {
        "label": "银行卡佣金比例",
        "value": "${rabate.bankCardTransfer * 100}%",
      },
      {
        "label": "支付宝佣金比例",
        "value": "${rabate.alipayTransfer * 100}%",
      },
      {
        "label": "微信佣金比例",
        "value": "${rabate.wechatTransfer * 100}%",
      }
    ];
    return Card(
      margin: const EdgeInsets.only(top: 8),
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
