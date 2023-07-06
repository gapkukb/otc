import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

class Fee extends StatefulWidget {
  const Fee({super.key});

  @override
  State<Fee> createState() => _FeeState();
}

class _FeeState extends State<Fee> {
  final List<dynamic> _items = [
    {
      "title": "现货",
      "label": "（使用BNB抵扣，享受25%折扣）",
      "children": [
        {
          "name": "挂单",
          "value": "0.07500%",
          "origin": "0.07500%",
        },
        {
          "name": "挂单",
          "value": "0.07500%",
          "origin": "0.07500%",
        },
      ]
    },
    {
      "title": "U本位合约",
      "label": "（使用BNB抵扣，享受10%折扣）",
      "children": [
        {
          "name": "挂单",
          "value": "0.07500%",
        },
        {
          "name": "挂单",
          "value": "0.07500%",
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              "手续费详情",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Divider(height: 1),
          IntrinsicHeight(
            child: Flex(
              direction: context.responsive<Axis>(
                Axis.vertical,
                lg: Axis.horizontal,
              ),
              children: [
                item(_items[0]),
                context.responsive(
                  const Divider(
                    height: 1,
                    endIndent: 24,
                    indent: 24,
                  ),
                  lg: const VerticalDivider(
                    thickness: 1,
                    width: 0.3,
                    endIndent: 16,
                    indent: 16,
                  ),
                ),
                item(_items[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  item(dynamic data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: data['title'],
                children: [
                  TextSpan(
                    text: data['label'],
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                subitem(data['children'][0]),
                subitem(data['children'][1]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  subitem(dynamic data) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 4,
            ),
            child: Text(
              data['name'],
              style: const TextStyle(
                color: Color(0xffA0AFC4),
                fontSize: 12,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              text: "${data["value"]}",
              children: data["origin"] == null
                  ? null
                  : [
                      const TextSpan(
                        text: " / ",
                      ),
                      TextSpan(
                        text: data["value"],
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                        ),
                      )
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
