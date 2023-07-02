import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

class WalletHome extends StatefulWidget {
  const WalletHome({super.key});

  @override
  State<WalletHome> createState() => _WalletHomeState();
}

List<dynamic> data = [
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
  {"Name": "John", "Age": 28, "Role": "Senior Supervisor"},
  {"Name": "Jane", "Age": 32, "Role": "Regional Administrator"},
];

class _WalletHomeState extends State<WalletHome> {
  static final List<Map<String, dynamic>> buttons = [
    {
      "onPressed": () {
        print('1111111');
      },
      "child": Text("充值")
    },
    {"onPressed": () {}, "child": Text("提现")},
    {"onPressed": () {}, "child": Text("站内转账")},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "钱包总览",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: buttons.map((e) {
              return HitTestBlocker(
                up: false,
                child: OutlinedButton(
                  onPressed: e['onPressed'],
                  child: e['child'],
                ),
              );
            }).toList(),
          ),
          IntrinsicHeight(
            child: Flex(
              direction: context.responsive(
                Axis.vertical,
                md: Axis.horizontal,
              ),
              children: [
                _item(),
                SizedBox(
                  width: 8,
                  height: 8,
                ),
                _item(),
                SizedBox(
                  width: 8,
                  height: 8,
                ),
                _item(),
              ],
            ),
          ),
          _list()
        ],
      ),
    );
  }

  _item() {
    return const Expanded(
      child: Card(
        child: ListTile(
          title: Text("账户余额"),
          subtitle: Text.rich(TextSpan(
              text: "590.00",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: " usdt",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ])),
        ),
      ),
    );
  }

  _list() {
    return Builder(builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: DataTable(
          // border: ,
          dividerThickness: 0,
          columns: [
            DataColumn(
              label: Text("类型"),
            ),
            DataColumn(
              label: Text("账户余额"),
            ),
            DataColumn(
              label: Text("可用余额"),
            ),
            DataColumn(
              label: Text("冻结余额"),
            ),
            DataColumn(
              label: Text("操作"),
            ),
          ],
          rows: data
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(
                      Text(e['Name']),
                    ),
                    DataCell(
                      Text(e['Age'].toString()),
                    ),
                    DataCell(
                      Text(e['Role']),
                    ),
                    DataCell(
                      Text(e['Role']),
                    ),
                    DataCell(
                      TextButton(
                        child: Text("查看"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
