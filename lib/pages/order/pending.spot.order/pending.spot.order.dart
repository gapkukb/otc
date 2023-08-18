import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class PendingSpotOrder extends StatefulWidget {
  const PendingSpotOrder({super.key});

  @override
  State<PendingSpotOrder> createState() => _PendingSpotOrderState();
}

class _PendingSpotOrderState extends State<PendingSpotOrder> {
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
                        DropdownItem(title: "USDT", value: 1, disabled: true),
                        DropdownItem(title: "USDC", value: 2, disabled: true),
                        DropdownItem(title: "BUSD", value: 3, disabled: true),
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
        body: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: DataTable2(
            columnSpacing: 4,
            headingTextStyle: Font.miniGrey,
            columns: const [
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
            rows: const [],
            empty: const UiEmptyView(),
          ),
        ),
      ),
    );
  }
}
