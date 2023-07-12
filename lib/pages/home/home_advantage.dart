import 'package:flutter/material.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/responsive.dart';

class HomeAdvantage extends StatelessWidget {
  const HomeAdvantage({super.key});
  static const List<Map<String, String>> datalist = [
    {
      "imageName": "Frame 135.png",
      "title": "易于使用",
      "subTitle": "选择XXX，实现投资自由",
    },
    {
      "imageName": "Frame 135 (1).png",
      "title": "最高佣金",
      "subTitle": "选择XXX，实现投资自由",
    },
    {
      "imageName": "Frame 135 (2).png",
      "title": "全天候客服",
      "subTitle": "选择XXX，实现投资自由",
    },
    {
      "imageName": "Frame 135 (3).png",
      "title": "绝对安全",
      "subTitle": "选择XXX，实现投资自由",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "选择XXX的理由",
          style: Font.x6largeBold,
        ),
        const SizedBox(height: 96),
        GridView.builder(
          itemCount: datalist.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 4,
            height: 420,
            crossAxisSpacing: 32,
          ),
          itemBuilder: (context, index) {
            final item = datalist[index];
            return newItem(item);
          },
        ),
      ],
    );
  }

  Widget newItem(dynamic item) {
    return Card(
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
            image: AssetImage(
              "assets/images/${item['imageName']}",
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['title'],
              style: Font.x4largeBold,
            ),
            const SizedBox(height: 16),
            Text(
              item['subTitle'],
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
