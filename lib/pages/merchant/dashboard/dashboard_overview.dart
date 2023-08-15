import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
// import 'package:otc/pages/merchant/dashboard/model.dart';
import 'package:otc/pages/merchant/dashboard/provider.dart';
// import 'package:otc/widgets/ui_button.dart';

const _style = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const _style2 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

class DashboardOverview extends ConsumerWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(context, ref) {
    // ref.read(dashboradProvider.notifier).update();
    final data = ref.watch(dashboradProvider);
    final List<Map<String, dynamic>> items = [
      {"label": "银行卡佣金比例", "value": data.bankcardRate * 100, "unit": "%"},
      {"label": "支付宝佣金比例", "value": data.aliRate * 100, "unit": "%"},
      {"label": "微信佣金比例", "value": data.wechatRate * 100, "unit": "%"},
      {"label": "下级人数", "value": data.subordinates},
      {"label": "昨日收益", "value": data.yesterdayCommission, "unit": "USDT"},
      {"label": "昨日成交量", "value": data.yesterdaySuccess},
      {"label": "总收益", "value": data.totalCommission, "unit": "USDT"},
      {"label": "总成交量", "value": data.totalSuccess},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            height: 108,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final i = index * 2;
            return _buildItem(items[i], items[i + 1]);
          },
        ),
      ),
    );
  }

  Widget _buildItem(Map<String, dynamic> item1, Map<String, dynamic> item2) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Row(
          children: [
            _buildSubItem(item1),
            VerticalDivider(
              width: 64,
              thickness: 0.5,
            ),
            _buildSubItem(item2),
          ],
        ),
      ),
    );
  }

  _buildSubItem(Map<String, dynamic> item) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(item['label']),
          Text.rich(
            TextSpan(
              text: item['value'].toString(),
              style: _style,
              children: item['unit'] == null
                  ? null
                  : [
                      const WidgetSpan(
                          child: SizedBox(
                        width: 8,
                      )),
                      TextSpan(
                        text: item['unit'],
                        style: _style2,
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
