import 'package:flutter/material.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/widgets/ui_chip.dart';

DropdownItem buildItem(Cryptocurrency item) {
  return DropdownItem(
    leading: item.icon,
    title: item.name,
    value: item.name,
  );
}

class CurrencySelector extends Dropdown {
  CurrencySelector({
    super.key,
    required super.name,
    super.formState,
    super.mode,
    super.initialValue,
    super.onChanged,
  }) : super(
          labelText: "选择币种",
          dropdownBuilder: (context, selectedItem) {
            if (selectedItem == null) return null;
            return SizedBox(
              height: 48,
              child: UiChip(
                text: selectedItem.title,
                iconWidget: selectedItem.leading,
                spacing: 8,
              ),
            );
          },
          props: PopupProps.menu(
            disabledItemFn: (item) => item.title != "USDT",
          ),
          data: Cryptocurrency.values.map(buildItem).toList(),
          validator: (value) {
            if (value == null) return "请选择币种";
            return null;
          },
        );
}
