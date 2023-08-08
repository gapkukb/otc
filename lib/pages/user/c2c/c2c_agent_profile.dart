import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/user/c2c/c2c.provider.dart';
import 'package:otc/utils/responsive.dart';

class C2cAgentProfile extends StatefulWidget {
  const C2cAgentProfile({super.key});

  @override
  State<C2cAgentProfile> createState() => _C2cAgentProfileState();
}

class _C2cAgentProfileState extends State<C2cAgentProfile> {
  static const TextStyle _titleTextSyle = TextStyle(
    fontSize: 12,
    color: Color(0xffa0afc4),
  );

  static const TextStyle _subtitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Panel(
      title: "做市商数据",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Consumer(
          builder: (context, ref, child) {
            final future = ref.watch(c2cProvider);
            return future.when(
              data: (data) {
                final range = data.rangeStat;
                final all = data.historyStat;

                final List<dynamic> items = [
                  {
                    "label": "30日买单数",
                    "value": range.makerBuyCount,
                    "unit": "次",
                  },
                  {
                    "label": "30日买单成功率",
                    "value": range.makerBugSuccessCount / range.makerBuyCount * 100,
                    "unit": "%",
                  },
                  {
                    "label": "30日卖单数",
                    "value": range.makerSellCount,
                    "unit": "次",
                  },
                  {
                    "label": "30日卖单成功率",
                    "value": range.makerSellSuccessCount / range.makerSellCount * 100,
                    "unit": "%",
                  },
                  {
                    "label": "总买单数",
                    "value": all.makerBuyCount,
                    "unit": "次",
                  },
                  {
                    "label": "总买单成功率",
                    "value": range.makerBugSuccessCount / range.makerBuyCount * 100,
                    "unit": "%",
                  },
                  {
                    "label": "总卖单数",
                    "value": all.makerSellCount,
                    "unit": "次",
                  },
                  {
                    "label": "总卖单成功率",
                    "value": all.makerSellSuccessCount / all.makerSellCount * 100,
                    "unit": "%",
                  },
                  {
                    "label": "30日做市佣金",
                    "value": data.commissionTotal,
                    "unit": "USDT",
                  },
                  {
                    "label": "总做市佣金",
                    "value": 0,
                    "unit": "USDT",
                  },
                  {
                    "label": "平均放行时间",
                    "value": all.makerConfirmTime / all.makerBugSuccessCount,
                    "unit": "分钟",
                  },
                  {
                    "label": "平均付款时间",
                    "value": all.makerNotifyTime / all.makerBugSuccessCount,
                    "unit": " 分钟",
                  },
                ];
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    height: context.responsive(56, lg: 94),
                    crossAxisCount: context.responsive(2, md: 6),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _buildItem(items[index]);
                  },
                );
              },
              error: (error, stackTrace) => Text(error.toString() + stackTrace.toString()),
              loading: () => const Center(
                heightFactor: 2,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildItem(dynamic data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data['label'],
          style: _titleTextSyle,
        ),
        Text(
          "${(data['value'] as num).isNaN ? 0 : data['value']} ${data['unit']}",
          style: _subtitleTextStyle,
        ),
      ],
    );
  }
}
