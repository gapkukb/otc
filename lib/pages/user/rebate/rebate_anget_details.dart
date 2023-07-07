import 'package:flutter/material.dart';
import 'package:otc/components/panel/panel.dart';

class RebateAgentDetails extends StatefulWidget {
  const RebateAgentDetails({super.key});

  @override
  State<RebateAgentDetails> createState() => _RebateAgentDetailsState();
}

class _RebateAgentDetailsState extends State<RebateAgentDetails> {
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
          columns: const [
            DataColumn(label: Text("时间")),
            DataColumn(label: Text("登录方式")),
            DataColumn(label: Text("状态")),
            DataColumn(label: Text("IP")),
            DataColumn(label: Text("IP")),
            DataColumn(label: Text("IP")),
          ],
          rows: const [
            DataRow(
              cells: [
                DataCell(Text("2022-05-15 13:13:42")),
                DataCell(Text("Web")),
                DataCell(Text("成功")),
                DataCell(Text("180.232.123.107")),
                DataCell(Text("180.232.123.107")),
                DataCell(Text("180.232.123.107")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
