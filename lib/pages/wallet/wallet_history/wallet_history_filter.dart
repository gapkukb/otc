import 'package:flutter/material.dart';
import 'package:otc/components/currency_selector/currency_selector.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/components/gap/gap.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_text_form_field.dart';

class WalletHistoryFilter extends StatefulWidget {
  final Function(Map<String, dynamic> searchForm) onSearch;
  const WalletHistoryFilter({
    super.key,
    required this.onSearch,
  });

  @override
  State<WalletHistoryFilter> createState() => _WalletHistoryFilterState();
}

class _WalletHistoryFilterState extends State<WalletHistoryFilter> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Dropdown(
                name: "type",
                labelText: "类型",
                selectedItem: DropdownItem(title: "充值", value: 0),
                data: [
                  DropdownItem(title: "充值", value: 0),
                  DropdownItem(title: "提币", value: 1),
                ],
              ),
            ),
            const Gap.small(horizition: true),
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
            const Gap.small(horizition: true),
            SizedBox(
              width: 160,
              child: CurrencySelector(name: "name"),
            ),
            const Gap.small(horizition: true),
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
            const Gap.small(horizition: true),
            SizedBox(
              width: 200,
              height: 48,
              child: UiTextFormField(
                labelText: "订单编号",
              ),
            ),
            Spacer(),
            UiButton(
              onPressed: () {},
              label: "搜索",
              variant: UiButtonVariant.filled,
              size: UiButtonSize.medium,
            )
          ],
        ),
      ),
    );
  }
}
