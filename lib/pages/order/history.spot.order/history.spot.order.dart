import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/date_picker/date_picker.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class HistorySpotOrder extends StatefulWidget {
  const HistorySpotOrder({super.key});

  @override
  State<HistorySpotOrder> createState() => _HistorySpotOrderState();
}

class _HistorySpotOrderState extends State<HistorySpotOrder> {
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
                    child: CurrencySelector(name: "currency"),
                  ),
                  SizedBox(
                    width: 150,
                    child: Dropdown(
                      name: "coin",
                      initialValue: 0,
                      labelText: "报价币",
                      data: [
                        DropdownItem(title: "全部", value: 0),
                        DropdownItem(title: "USDT", value: 1),
                        DropdownItem(title: "USDC", value: 2, disabled: true),
                        DropdownItem(title: "BUSD", value: 3, disabled: true),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Dropdown(
                      name: "sell",
                      initialValue: 0,
                      labelText: "方向",
                      data: [
                        DropdownItem(title: "全部", value: 0),
                        DropdownItem(
                          title: "买入",
                          value: 1,
                        ),
                        DropdownItem(
                          title: "卖出",
                          value: 2,
                        ),
                      ],
                    ),
                  ),
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
              DataColumn2(label: Text("日期")),
              DataColumn2(label: Text("交易对")),
              DataColumn2(label: Text("类型")),
              DataColumn2(label: Text("方向")),
              DataColumn2(label: Text("平均")),
              DataColumn2(label: Text("价格")),
              DataColumn2(label: Text("已执行")),
              DataColumn2(label: Text("金额")),
              DataColumn2(label: Text("共计")),
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
