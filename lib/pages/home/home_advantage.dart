import 'package:flutter/material.dart';
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
    return Flex(
      direction: context.responsive(
        Axis.vertical,
        md: Axis.horizontal,
      ),
      children: datalist.map((item) {
        final _item = newItem(
          item['imageName']!,
          item['title']!,
          item['subTitle']!,
        );
        return context.responsive(
          _item,
          md: Flexible(child: _item),
        );
      }).toList(),
    );
  }

  Widget newItem(String imageName, String title, String subTitle) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 88),
          Image.asset("assets/images/$imageName"),
        ],
      ),
    );
  }
}
