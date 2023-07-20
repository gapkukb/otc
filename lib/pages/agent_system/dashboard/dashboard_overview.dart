import 'package:flutter/material.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/widgets/ui_button.dart';

const _style = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const _style2 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

class DashboardOverview extends StatefulWidget {
  const DashboardOverview({super.key});

  @override
  State<DashboardOverview> createState() => _DashboardOverviewState();
}

class _DashboardOverviewState extends State<DashboardOverview> {
  List<Map<String, dynamic>> items = [
    {"label": "佣金比例", "value": "39999", "unit": "%"},
    {"label": "下级人数", "value": "39999"},
    {"label": "昨日收益", "value": "39999", "unit": "USDT"},
    {"label": "昨日成交量", "value": "39999"},
    {"label": "总收益", "value": "39999", "unit": "USDT"},
    {"label": "总成交量", "value": "39999"},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            height: 108,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            if (index == 0) return _buildBalance(context);
            final i = (index - 1) * 2;
            return _buildItem(items[i], items[i + 1]);
          },
        ),
      ),
    );
  }

  _buildBalance(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "佣金余额",
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  "300.00",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                ),
                const Spacer(),
                UiButton(
                  shape: UiButtonShape.rounded,
                  label: "划转",
                  color: Colors.white,
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                UiButton(
                  variant: UiButtonVariant.outline,
                  shape: UiButtonShape.rounded,
                  label: "划转记录",
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            )
          ],
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
