import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/components/row_gap/row_gap.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletHistoryPlatformFilter extends StatefulWidget {
  final void Function() onSearch;
  final Map<String, dynamic> formState;
  const WalletHistoryPlatformFilter({
    super.key,
    required this.onSearch,
    required this.formState,
  });

  @override
  State<WalletHistoryPlatformFilter> createState() => _WalletHistoryPlatformFilterState();
}

class _WalletHistoryPlatformFilterState extends State<WalletHistoryPlatformFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RowGap(
        items: [
          SizedBox(
            width: 120,
            child: Dropdown(
              name: "deposit",
              formState: widget.formState,
              labelText: "类型",
              initialValue: true,
              data: [
                DropdownItem(title: "充值", value: true),
                DropdownItem(title: "提币", value: false),
              ],
            ),
          ),
          SizedBox(
            width: 130,
            child: Dropdown(
              name: "datetime",
              labelText: "时间",
              formState: widget.formState,
              initialValue: 7,
              data: [
                DropdownItem(
                  title: "近7天",
                  value: 7,
                ),
                DropdownItem(
                  title: "近30天",
                  value: 30,
                ),
                DropdownItem(
                  title: "近90天",
                  value: 90,
                ),
                DropdownItem(
                  title: "近180天",
                  value: 180,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160,
            child: CurrencySelector(
              name: "currency",
              formState: widget.formState,
              initialValue: Cryptocurrency.USDT.name,
            ),
          ),
          SizedBox(
            width: 200,
            height: 48,
            child: UiTextFormField(
              name: "reference",
              formState: widget.formState,
              labelText: "订单编号",
            ),
          ),
          UiButton.text(
            onPressed: widget.onSearch,
            label: "搜索",
            height: 48,
          ),
        ],
      ),
    );
  }
}
