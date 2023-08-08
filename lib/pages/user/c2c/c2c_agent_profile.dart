import 'package:flutter/material.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/panel/panel.dart';
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

  final List<dynamic> _items = [
    {
      "label": "30日挂单数",
      "value": "15543",
      "unit": "次",
    },
    {
      "label": "总买单数",
      "value": "15543",
      "unit": "次",
    },
    {
      "label": "30日卖单数",
      "value": "15543",
      "unit": "次",
    },
    {
      "label": "总卖单数",
      "value": "15543",
      "unit": "%",
    },
    {
      "label": "30日做市佣金",
      "value": "15543",
      "unit": " USDT",
    },
    {
      "label": "总做市佣金",
      "value": "15543",
      "unit": " USDT",
    },
    {
      "label": "30日成单成功率",
      "value": "15543",
      "unit": "%",
    },
    {
      "label": "总买单成功率",
      "value": "15543",
      "unit": "%",
    },
    {
      "label": "30日卖单成单率",
      "value": "15543",
      "unit": "%",
    },
    {
      "label": "总卖单成功率",
      "value": "15543",
      "unit": "分钟",
    },
    {
      "label": "平均放行时间",
      "value": "15543",
      "unit": "分钟",
    },
    {
      "label": "平均付款时间",
      "value": "15543",
      "unit": "分钟",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Panel(
      title: "做市商数据",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            height: context.responsive(56, lg: 94),
            crossAxisCount: context.responsive(2, md: 6),
          ),
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(_items[index]);
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
          "${data['value']}${data['unit']}",
          style: _subtitleTextStyle,
        ),
      ],
    );
  }
}
