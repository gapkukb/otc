import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:otc/components/modal_page_template/modal_page_template.dart';
import 'package:otc/models/ad.my/ad.my.taker.model.dart';
import 'package:otc/widgets/ui_button.dart';

class AdOwnWindow extends StatelessWidget {
  final List<AdMyTakerModel> records;
  const AdOwnWindow({
    super.key,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    return ModalPageTemplate(
      title: "广告详情",
      onCompelete: (context) {},
      children: [
        DataTable2(
          columns: const [
            DataColumn2(label: Text("广告编号\n币种/法币"), fixedWidth: 160),
            DataColumn2(label: Text("类型")),
            DataColumn2(label: Text("已成交数量")),
            DataColumn2(label: Text("已成交价格")),
            DataColumn2(label: Text("汇率")),
            DataColumn2(label: Text("支付方式")),
            DataColumn2(label: Text("买方姓名")),
            DataColumn2(label: Text("状态")),
            DataColumn2(label: Text("创建时间")),
            DataColumn2(label: Text("操作")),
          ],
          columnSpacing: 4,
          dividerThickness: 0.001,
          rows: records.map((row) {
            return DataRow(cells: [
              DataCell(Text(row.sell ? "出售" : "购买")),
            ]);
          }).toList(),
        ),
      ],
    );
  }
}

class AdOwnWindowAction extends StatelessWidget {
  final String state;
  const AdOwnWindowAction({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return UiButton(
      onPressed: () {},
      child: CountdownTimer(
        endTime: 180,
        widgetBuilder: (_, time) {
          return const Text("联系客服");
        },
        onEnd: () {},
      ),
    );
  }
}
