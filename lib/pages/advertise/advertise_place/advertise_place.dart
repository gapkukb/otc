import 'package:flutter/material.dart';
import 'package:otc/pages/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/pages/components/user_modal_page_template/user_modal_page_template.dart';

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
      onCompelete: () {},
      children: [
        Text("data"),
        Text("数量"),
        _buildChoice(),
        SizedBox(height: 8),
        Text("汇率调控"),
      ],
    );
  }

  _buildChoice() {
    return GridView.builder(
      itemCount: _items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 4,
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
