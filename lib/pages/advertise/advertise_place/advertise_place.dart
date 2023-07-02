import 'package:flutter/material.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/components/user_modal_page_template/user_modal_page_template.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_number_stepper.dart';

class AdvertisePlace extends StatefulWidget {
  const AdvertisePlace({super.key});

  @override
  State<AdvertisePlace> createState() => _AdvertisePlaceState();
}

class _AdvertisePlaceState extends State<AdvertisePlace> {
  final List<dynamic> _items = [
    {"value": 100, "unit": "USDT"},
    {"value": 200, "unit": "USDT"},
    {"value": 500, "unit": "USDT"},
    {"value": 1000, "unit": "USDT"},
    {"value": 2000, "unit": "USDT"},
    {"value": 5000, "unit": "USDT"},
    {"value": 10000, "unit": "USDT"},
    {"value": 20000, "unit": "USDT"},
  ];
  late int _value;

  late String gender = "male";

  @override
  void initState() {
    _value = _items[0]['value'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserModalPageTemplate(
      legend: "发布新广告",
      title: "出售",
      icon: Icons.currency_exchange,
      nextText: "发布",
      onCompelete: () {},
      children: _buildNext(),
    );
  }

  List<Widget> _buildNext() {
    return [
      _buildCell(
        title1: "类型",
        subtitle1: "0.79000000 USDT",
        title2: "币种",
        subtitle2: "2 USDT",
      ),
      const Divider(height: 0.1, thickness: 0.5),
      _buildCell(
        title1: "参考汇率",
        subtitle1: "6.47 CNY",
        title2: "成交汇率",
        subtitle2: "6.47 CNY",
      ),
      const Divider(height: 0.1, thickness: 0.5),
      _buildCell(
        title1: "数量",
        subtitle1: "1000,00 USDT",
        title2: "成交价格",
        subtitle2: "6.570 CNY",
      ),
      const SizedBox(height: 24),
      _buildCell(
        title1: "支付方式",
        subtitle1: "银行卡",
        title2: "支付时效",
        subtitle2: "15分钟",
      ),
    ];
  }

  List<Widget> _buildForm() {
    return [
      const Text("参考汇率：6.47"),
      const SizedBox(height: 24),
      const Text("数量"),
      const SizedBox(height: 8),
      _buildChoice(),
      const SizedBox(height: 24),
      const Text("汇率调控"),
      const SizedBox(height: 8),
      FittedBox(
        fit: BoxFit.fitHeight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          child: const UiNumberStepper(
            unit: "%",
            max: 100,
            min: 0,
          ),
        ),
      ),
      const SizedBox(height: 24),
      _buildCell(
        title1: "成交价",
        subtitle1: "657 CNY",
        title2: "支付方式",
        subtitle2: "银行卡划转",
      ),
    ];
  }

  Container _buildCell({
    required String title1,
    required String subtitle1,
    required String title2,
    required String subtitle2,
  }) {
    return Container(
      color: const Color(0xffF7F9FA),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              style: const TextStyle(height: 1.8),
              TextSpan(
                text: "$title1\n",
                children: [
                  TextSpan(
                    text: subtitle1,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 1,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey,
          ),
          Expanded(
            child: Text.rich(
              style: const TextStyle(height: 1.8),
              TextSpan(
                text: "$title2\n",
                children: [
                  TextSpan(
                    text: subtitle2,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildChoice() {
    return GridView.builder(
      itemCount: _items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: context.responsive(2, lg: 4),
        height: 34,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        var item = _items[index];

        return ChoiceChip(
          avatar: null,
          label: SizedBox.expand(
            child: Text(
              "${item['value']} ${item['unit']}",
              textAlign: TextAlign.center,
            ),
          ),
          selected: _value == item['value'],
          onSelected: (selected) {
            _value = item['value'];
            setState(() {});
          },
        );
      },
    );
  }
}
