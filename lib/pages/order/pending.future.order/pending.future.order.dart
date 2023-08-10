import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class PendingFutureOrder extends StatefulWidget {
  const PendingFutureOrder({super.key});

  @override
  State<PendingFutureOrder> createState() => _PendingFutureOrderState();
}

class _PendingFutureOrderState extends State<PendingFutureOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
          child: AppBar(
            clipBehavior: Clip.none,
            title: Wrap(
              spacing: 16,
              children: [
                SizedBox(
                  width: 150,
                  child: Dropdown(
                    name: "coin",
                    initialValue: 0,
                    labelText: "筛选",
                    data: [
                      DropdownItem(title: "全部", value: 0),
                      DropdownItem(
                        title: "限价订单",
                        value: 1,
                      ),
                      DropdownItem(
                        title: "止盈止损委托",
                        value: 2,
                      ),
                      DropdownItem(
                        title: "市价止损订单",
                        value: 3,
                      ),
                      DropdownItem(
                        title: "限价止盈订单",
                        value: 4,
                      ),
                      DropdownItem(
                        title: "市价止盈订单",
                        value: 5,
                      ),
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
      body: DataTable2(
        columnSpacing: 4,
        headingTextStyle: Font.miniGrey,
        columns: const [
          DataColumn2(label: Text("合约")),
          DataColumn2(label: Text("时间")),
          DataColumn2(label: Text("订单类型")),
          DataColumn2(label: Text("价格")),
          DataColumn2(label: Text("方向")),
          DataColumn2(label: Text("订单数量")),
          DataColumn2(label: Text("完全成交")),
          DataColumn2(label: Text("触发条件")),
          DataColumn2(label: Text("操作")),
        ],
        rows: const [],
        empty: const UiEmptyView(),
      ),
    );
  }
}
