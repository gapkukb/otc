import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class OrderC2cAll extends StatefulWidget {
  const OrderC2cAll({super.key});

  @override
  State<OrderC2cAll> createState() => _OrderC2cAllState();
}

class _OrderC2cAllState extends State<OrderC2cAll> {
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columns: [
        DataColumn2(label: Text("订单号")),
        DataColumn2(label: Text("订单类型")),
        DataColumn2(label: Text("币种")),
        DataColumn2(label: Text("价格")),
        DataColumn2(label: Text("数量")),
        DataColumn2(label: Text("总额")),
        DataColumn2(label: Text("用户名")),
        DataColumn2(label: Text("支付方式")),
        DataColumn2(label: Text("状态")),
        DataColumn2(label: Text("时间")),
        DataColumn2(label: Text("操作")),
      ],
      rows: [],
      empty: UiEmptyView(),
    );
  }
}
