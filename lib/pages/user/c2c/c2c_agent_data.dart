import 'package:flutter/material.dart';
import 'package:otc/components/panel/panel.dart';

class C2cAgentData extends StatefulWidget {
  const C2cAgentData({super.key});

  @override
  State<C2cAgentData> createState() => _C2cAgentDataState();
}

class _C2cAgentDataState extends State<C2cAgentData> {
  static const _columns = [
    DataColumn(label: Text("时间")),
    DataColumn(label: Text("登录方式")),
    DataColumn(label: Text("状态")),
    DataColumn(label: Text("IP")),
  ];

  static List<dynamic> _items = List.generate(
    10,
    (index) => {
      "time": "2022-05-15 13:13:42",
      "platform": "Web",
      "status": "成功",
      "ip": "180.232.123.107",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Panel(
      title: "做市商数据",
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          dividerThickness: 0.01,
          headingTextStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          columns: _columns,
          rows: _items.map(_buidRow).toList(),
        ),
      ),
    );
  }

  DataRow _buidRow(dynamic item) {
    return DataRow(
      cells: [
        DataCell(Text(item["time"])),
        DataCell(Text(item["platform"])),
        DataCell(Text(item["status"])),
        DataCell(Text(item["ip"])),
      ],
    );
  }
}
