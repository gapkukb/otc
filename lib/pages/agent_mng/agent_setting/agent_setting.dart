import 'package:flutter/material.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/pages/notice/notice.dart';

class AgentSetting extends StatefulWidget {
  const AgentSetting({super.key});

  @override
  State<AgentSetting> createState() => _AgentSettingState();
}

class _AgentSettingState extends State<AgentSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("以银行卡为例："),
            const Text("若整条线的利润为5.00%，做市商的固定收益为2.00%，总代有3%的利润可分配给下级"),
            const Text(
              "佣金比例可能会根据时段有不同的调整，详情请关注公告。",
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
            Divider(
              height: 49,
              thickness: 0.5,
            ),
            blockTitle("代理佣金比例"),
            block(),
            blockTitle("1代理佣金比例"),
            block(),
            blockTitle("2代理佣金比例"),
            block(),
            blockTitle("做市商"),
            block(),
            SizedBox(
              height: 1000,
              child: Notice(),
            )
          ],
        ),
      ),
    );
  }

  blockTitle(String text) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: Text(text),
    );
  }

  block() {
    return Row(
      children: PaymentChannel.values.map((pc) {
        return Column(
          children: [
            Text(pc.name),
            Slider(
              max: 100,
              min: 0,
              value: 50,
              divisions: 10,
              label: "发生的",
              onChanged: null,
            ),
          ],
        );
      }).toList(),
    );
  }
}
