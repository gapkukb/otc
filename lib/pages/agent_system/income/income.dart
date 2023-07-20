import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AgentSystemIncome extends StatefulWidget {
  const AgentSystemIncome({super.key});

  @override
  State<AgentSystemIncome> createState() => _AgentSystemIncomeState();
}

class _AgentSystemIncomeState extends State<AgentSystemIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    enabled: false,
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: SfDateRangePicker(),
                    ),
                  )
                ];
              },
            ),
            PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text(""),
                  )
                ];
              },
            ),
            FilledButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: 300,
                        height: 300,
                        child: SfDateRangePicker(),
                      );
                    },
                  );
                },
                child: Text("data"))
          ],
        ),
      ),
      body: Container(
        child: DataTable2(
          dividerThickness: 0.01,
          columnSpacing: 2,
          fixedTopRows: 1,
          columns: const [
            DataColumn2(label: Text("广告编号")),
            DataColumn2(label: Text("类型")),
            DataColumn2(label: Text("已成交数量")),
            DataColumn2(label: Text("已成交价格")),
            DataColumn2(label: Text("汇率")),
            DataColumn2(label: Text("支付方式")),
            DataColumn2(label: Text("更新时间")),
            DataColumn2(label: Text("佣金比例")),
            DataColumn2(label: Text("佣金数量")),
          ],
          rows: List.generate(
            10,
            (index) => DataRow(
              cells: List.generate(
                9,
                (index) => DataCell(
                  PaymentChannel.fromType(0).widget,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
