import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/date_picker/date_picker.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/payment_channel/payment_channel.dart';

class AgentIncome extends StatefulWidget {
  const AgentIncome({super.key});

  @override
  State<AgentIncome> createState() => _AgentIncomeState();
}

class _AgentIncomeState extends State<AgentIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          clipBehavior: Clip.none,
          title: UnconstrainedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Form(
                child: Wrap(
                  spacing: 16,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 56,
                      child: CurrencySelector(name: "name"),
                    ),
                    SizedBox(
                      width: 150,
                      height: 56,
                      child: Dropdown(
                        labelText: "交易类型",
                        name: "",
                        data: [
                          DropdownItem(title: "购买", value: 0),
                          DropdownItem(title: "出售", value: 1),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 56,
                      child: Dropdown(
                        labelText: "交易方式",
                        name: "",
                        data: PaymentMethods.values.map((channel) {
                          return DropdownItem(title: channel.text, value: 0);
                        }).toList(),
                      ),
                    ),
                    DatePicker(
                      labelText: "开始日期",
                      maxDate: DateTime.now(),
                      minDate: DateTime(1970),
                    ),
                    DatePicker(
                      labelText: "结束日期",
                      maxDate: DateTime.now(),
                      minDate: DateTime(1970),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                  PaymentMethods.fromType(0).widget,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
