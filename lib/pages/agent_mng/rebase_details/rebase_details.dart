import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';

class RebaseDetails extends StatefulWidget {
  const RebaseDetails({super.key});

  @override
  State<RebaseDetails> createState() => _RebaseDetailsState();
}

class _RebaseDetailsState extends State<RebaseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
            100,
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
