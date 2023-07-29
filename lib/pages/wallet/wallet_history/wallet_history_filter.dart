import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletHistoryFilter extends StatefulWidget {
  final void Function() onSearch;
  final Map<String, dynamic> formState;
  const WalletHistoryFilter({
    super.key,
    required this.onSearch,
    required this.formState,
  });

  @override
  State<WalletHistoryFilter> createState() => _WalletHistoryFilterState();
}

class _WalletHistoryFilterState extends State<WalletHistoryFilter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Dropdown(
              name: "deposit",
              formState: widget.formState,
              labelText: "类型",
              data: [
                DropdownItem(title: "充值", value: true),
                DropdownItem(title: "提币", value: false),
              ],
            ),
          ),
          // const Gap.small(horizition: true),
          // SizedBox(
          //   width: 130,
          //   child: Dropdown(
          //     name: "type",
          //     labelText: "时间",
          //     formState: widget.formState,
          //     data: [
          //       DropdownItem(
          //         title: "近7天",
          //         value: DateTime.now().subtract(const Duration(days: 7)).format(),
          //       ),
          //       DropdownItem(
          //         title: "近30天",
          //         value: DateTime.now().subtract(const Duration(days: 30)).format(),
          //       ),
          //       DropdownItem(
          //         title: "近90天",
          //         value: DateTime.now().subtract(const Duration(days: 90)).format(),
          //       ),
          //       DropdownItem(
          //         title: "近180天",
          //         value: DateTime.now().subtract(const Duration(days: 180)).format(),
          //       ),
          //     ],
          //   ),
          // ),
          // const Gap.small(horizition: true),
          // SizedBox(
          //   width: 160,
          //   child: CurrencySelector(
          //     name: "currency",
          //     formState: widget.formState,
          //   ),
          // ),
          // const Gap.small(horizition: true),
          // SizedBox(
          //   width: 120,
          //   child: Dropdown(
          //     name: "confirmed",
          //     labelText: "状态",
          //     formState: widget.formState,
          //     data: [
          //       DropdownItem(title: "全部", value: "UNKNOWN"),
          //       DropdownItem(title: "已完成", value: "YES"),
          //       DropdownItem(title: "待确认", value: "NO"),
          //     ],
          //   ),
          // ),
          // const Gap.small(horizition: true),
          // SizedBox(
          //   width: 200,
          //   height: 48,
          //   child: UiTextFormField(
          //     name: "reference",
          //     formState: widget.formState,
          //     labelText: "订单编号",
          //   ),
          // ),
          // const Spacer(),
          // UiButton(
          //   onPressed: widget.onSearch,
          //   label: "搜索",
          //   variant: UiButtonVariant.filled,
          //   size: UiButtonSize.medium,
          // )
        ],
      ),
    );
  }
}
