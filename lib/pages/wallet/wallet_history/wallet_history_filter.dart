import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/models/currency.dart';
import 'package:otc/widgets/ui_dropdown.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletHistoryFilter extends StatefulWidget {
  const WalletHistoryFilter({super.key});

  @override
  State<WalletHistoryFilter> createState() => _WalletHistoryFilterState();
}

class _WalletHistoryFilterState extends State<WalletHistoryFilter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: UiDropdown(
            label: "类型",
            selected: 0,
            items: [
              UiDropdownItem(name: "充值", value: 0),
              UiDropdownItem(name: "提币", value: 1),
            ],
          ),
        ),
        Flexible(
          child: UiDropdown(
            label: "时间",
            selected: 0,
            items: [
              UiDropdownItem(name: "近7天", value: 0),
              UiDropdownItem(name: "近30天", value: 1),
              UiDropdownItem(name: "近90天", value: 2),
              UiDropdownItem(name: "近180天", value: 3),
            ],
          ),
        ),
        Flexible(
          child: UiDropdown(
            selected: 0,
            items: CurrencyCollection.values
                .map(
                  (e) => UiDropdownItem(name: "近7天", value: 0),
                )
                .toList(),
          ),
        ),
        Flexible(
          child: UiDropdown(
            selected: 0,
            items: [
              UiDropdownItem(name: "充值", value: 0),
              UiDropdownItem(name: "提币", value: 1),
            ],
          ),
        ),
      ],
    );
  }
}
