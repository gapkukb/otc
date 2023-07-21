import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:otc/pages/agent/agent_setting/agent_setting.slider.dart';
import 'package:otc/pages/async_builder/async_builder.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';

class AgentSetting extends StatefulWidget {
  const AgentSetting({super.key});

  @override
  State<AgentSetting> createState() => _AgentSettingState();
}

class _AgentSettingState extends State<AgentSetting> {
  @override
  void initState() {
    super.initState();
  }

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
            AsyncBuilder(
              future: () {
                return apis.agent.getAgentSetting();
              },
              builder: (context, data) {
                int i = 0;
                final items =
                    ["代理佣金比例", "1代理佣金比例", "2代理佣金比例", "做市商"].map((group) {
                  i++;
                  final disabled = i == 4;
                  return Block(
                      groupName: group,
                      items: PaymentChannel.values.map((item) {
                        return _Item(
                          channel: item,
                          min: disabled ? 0 : 0.5,
                          max: 2.5,
                          value: data["${item.name}Lv$i"],
                          name: item.text,
                          disabled: disabled,
                        );
                      }).toList());
                }).toList();

                return Column(
                  children: items,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Item {
  final PaymentChannel channel;
  final double min;
  final double max;
  final double value;
  final String name;
  final bool? disabled;

  const _Item({
    required this.channel,
    required this.min,
    required this.max,
    required this.value,
    required this.name,
    this.disabled,
  });
}

class Block extends StatelessWidget {
  final String groupName;
  final List<_Item> items;
  const Block({
    super.key,
    required this.groupName,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BlockTitle(text: groupName),
        const Gap.small(),
        GridView.builder(
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
            final item = items[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.name),
                AgentSettingSlider(
                  disabled: item.disabled,
                  min: item.min,
                  max: item.max,
                  value: item.value,
                  name: item.name,
                ),
                Text(
                  item.disabled == true
                      ? "固定比例，不可更改"
                      : "在${item.min}%~${item.max}%范围内选择，下级至少会获得${item.min}%的返佣",
                  style: Font.miniGrey,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _BlockTitle extends StatelessWidget {
  final String text;
  const _BlockTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
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
}
