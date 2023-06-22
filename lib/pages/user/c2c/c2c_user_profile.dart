import 'package:flutter/material.dart';
import 'package:otc/pages/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/pages/components/panel/panel.dart';
import 'package:otc/utils/responsive.dart';

class C2cUserProfile extends StatefulWidget {
  const C2cUserProfile({super.key});

  @override
  State<C2cUserProfile> createState() => _C2cUserProfileState();
}

class _C2cUserProfileState extends State<C2cUserProfile> {
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
      "label": "30日成单率",
      "value": "15543",
      "unit": "%",
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
    {
      "label": "已注册",
      "value": "15543",
      "unit": "天前",
    },
    {
      "label": "总买单成单率",
      "value": "15543",
      "unit": "%",
    },
    {
      "label": "总成单数",
      "value": "15543",
      "unit": "次",
    },
    {
      "label": "交易对手数",
      "value": "15543",
      "unit": "",
    },
    {
      "label": "合约总成交量",
      "value": "15543",
      "unit": "",
    },
    {
      "label": "合约30日成交量",
      "value": "15543",
      "unit": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Panel(
      title: "用户数据",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            height: context.responsive(56, lg: 94),
            crossAxisCount: context.responsive(2, md: 5),
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
