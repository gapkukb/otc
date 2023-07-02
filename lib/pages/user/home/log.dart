import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("时间")),
          DataColumn(label: Text("登录方式")),
          DataColumn(label: Text("状态")),
          DataColumn(label: Text("IP")),
        ],
        rows: const [
          DataRow(
            cells: [
              DataCell(Text("2022-05-15 13:13:42")),
              DataCell(Text("Web")),
              DataCell(Text("成功")),
              DataCell(Text("180.232.123.107")),
            ],
          )
        ],
      ),
    );
  }
}
