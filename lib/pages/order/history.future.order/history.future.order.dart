import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/date_picker/date_picker.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class HistoryFutureOrder extends StatefulWidget {
  const HistoryFutureOrder({super.key});

  @override
  State<HistoryFutureOrder> createState() => _HistoryFutureOrderState();
}

class _HistoryFutureOrderState extends State<HistoryFutureOrder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 32, 0),
            child: AppBar(
              clipBehavior: Clip.none,
              title: Wrap(
                spacing: 16,
                children: [
                  SizedBox(
                    width: 150,
                    child: DatePicker(
                      labelText: "开始日期",
                      maxDate: DateTime.now(),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: DatePicker(
                      labelText: "结束日期",
                      maxDate: DateTime.now(),
                    ),
                  ),
                ],
              ),
              actions: [
                UiButton(
                  onPressed: () {},
                  label: "搜索",
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: DataTable2(
            columnSpacing: 4,
            headingTextStyle: Font.miniGrey,
            columns: const [
              DataColumn2(label: Text("合约")),
              DataColumn2(label: Text("时间")),
              DataColumn2(label: Text("订单类型")),
              DataColumn2(label: Text("方向")),
              DataColumn2(label: Text("价格")),
              DataColumn2(label: Text("成交均价")),
              DataColumn2(label: Text("成交数量")),
              DataColumn2(label: Text("金额")),
              DataColumn2(label: Text("触发条件")),
              DataColumn2(label: Text("状态")),
            ],
            rows: const [],
            empty: const UiEmptyView(),
          ),
        ),
      ),
    );
  }
}
