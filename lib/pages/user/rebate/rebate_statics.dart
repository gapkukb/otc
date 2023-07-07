import 'package:flutter/material.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/utils/number.dart';

final List<Map<String, dynamic>> tabItems = [
  {"label": "30日挂单数", "value": 0},
  {"label": "30日成单率", "value": 1},
  {"label": "平均放行时间", "value": 2},
  {"label": "平均付款时间", "value": 3},
];

class RebateStatics extends StatefulWidget {
  const RebateStatics({super.key});

  @override
  State<RebateStatics> createState() => _RebateStaticsState();
}

class _RebateStaticsState extends State<RebateStatics> {
  final List<Map<String, dynamic>> items = [
    {"label": "全部", "value": tabItems},
    {"label": "昨天", "value": tabItems},
    {"label": "本周", "value": tabItems},
    {"label": "本月", "value": tabItems},
  ];

  @override
  Widget build(BuildContext context) {
    final style =
        Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey);

    return DefaultTabController(
      length: items.length,
      child: Panel(
        titleWidget: TabBar(
          isScrollable: true,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 32.0,
          ),
          tabs: items.map((e) => Text(e['label'])).toList(),
        ),
        footer: Padding(
          padding: const EdgeInsets.only(
            bottom: 24.0,
            left: 32.0,
            right: 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "数据更新时间以UTC+0时区为准，每日凌晨3至5点(UTC+0)为维护时间。在此期间，收益值计算以前日资产为基准。维护结束后，可展示正常当日收益。",
                style: style,
              ),
              Text(
                "特别说明：由于相关业务数据复杂，可能存在计算误差及计算延迟情况，以上数据仅供参考，给您带来的不便，敬请谅解。",
                style: style,
              ),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 130,
          child: TabBarView(
            children: items.map((e) => _buildTabBody(e['value'])).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBody(List<Map<String, dynamic>> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
      child: Row(
        children: item.map((e) => _buildTabBodyItem(e)).toList(),
      ),
    );
  }

  Widget _buildTabBodyItem(Map<String, dynamic> item) {
    return Expanded(
      child: Card(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item['label'],
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                (item['value'] as num).decimalize(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
