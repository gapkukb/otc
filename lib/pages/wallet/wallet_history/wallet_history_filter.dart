import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletHistoryFilter extends StatefulWidget {
  const WalletHistoryFilter({super.key});

  @override
  State<WalletHistoryFilter> createState() => _WalletHistoryFilterState();
}

class _WalletHistoryFilterState extends State<WalletHistoryFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        alignment: WrapAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Dropdown(
              name: "type",
              labelText: "类型",
              data: [
                DropdownItem(title: "充值", value: 0),
                DropdownItem(title: "提币", value: 1),
              ],
            ),
          ),
          SizedBox(
            width: 130,
            child: Dropdown(
              name: "type",
              labelText: "时间",
              data: [
                DropdownItem(title: "近7天", value: 0),
                DropdownItem(title: "近30天", value: 1),
                DropdownItem(title: "近90天", value: 2),
                DropdownItem(title: "近180天", value: 3),
              ],
            ),
          ),
          SizedBox(
            width: 140,
            child: CurrencySelector(name: "name"),
          ),
          SizedBox(
            width: 120,
            child: Dropdown(
              name: "type",
              labelText: "状态",
              data: [
                DropdownItem(title: "全部", value: 0),
                DropdownItem(title: "已完成", value: 1),
                DropdownItem(title: "待确认", value: 2),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 48,
            child: UiTextFormField(
              labelText: "订单编号",
            ),
          ),
        ],
      ),
    );
  }
}
