import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otc/components/dropdown/dropdown.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/widgets/ui_chip.dart';

class CurrencySelector extends Dropdown {
  CurrencySelector({
    super.key,
    required super.name,
    super.formState,
    super.type,
  }) : super(
          labelText: "选择币种",
          dropdownBuilder: (context, selectedItem) {
            if (selectedItem == null) return null;
            return UiChip(
              text: selectedItem.title,
              iconWidget: selectedItem.leading,
              spacing: 16,
            );
          },
          data: Coins.enabled.map((item) {
            return DropdownItem(
              leading: SvgPicture.asset(
                item.iconPath,
                width: 24,
                fit: BoxFit.cover,
                allowDrawingOutsideViewBox: true,
                clipBehavior: Clip.none,
              ),
              title: item.name,
            );
          }).toList(),
        );
}
