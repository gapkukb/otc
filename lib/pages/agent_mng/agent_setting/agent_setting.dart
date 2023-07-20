import 'package:flutter/material.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';

class AgentSystemSetting extends StatefulWidget {
  const AgentSystemSetting({super.key});

  @override
  State<AgentSystemSetting> createState() => _AgentSystemSettingState();
}

class _AgentSystemSettingState extends State<AgentSystemSetting> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: Pads.lg,
        child: ListView(
          children: [
            const Text("以银行卡为例："),
            const Gap.mini(),
            const Text("若整条线的利润为5.00%，做市商的固定收益为2.00%，总代有3%的利润可分配给下级"),
            const Gap.mini(),
            const Text(
              "佣金比例可能会根据时段有不同的调整，详情请关注公告。",
              style: TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
            const Divider(
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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        height: 140,
        crossAxisCount: 3,
        mainAxisSpacing: 32,
        crossAxisSpacing: 32,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(pc.name),
            Padding(
              padding: Pads.yAxisSm,
              child: Slider(
                max: 100,
                min: 0,
                value: 50,
                divisions: 10,
                label: "发生的",
                onChanged: (value) {},
              ),
            ),
            Text(
              "在0.5%~2.5%范围内选择，下级至少会获得0.5%的返佣",
              style: Font.miniGrey,
            ),
          ],
        );
      },
    );
  }
}
