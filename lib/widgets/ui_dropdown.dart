import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class UiDropdownItem {
  final String name;
  final dynamic value;
  final bool? disabled;

  UiDropdownItem({
    required this.name,
    required this.value,
    this.disabled,
  });
}

class UiDropdown extends DropdownSearch<UiDropdownItem> {
  final dynamic selected;
  final String? label;
  UiDropdown({
    super.key,
    super.items,
    this.selected,
    super.asyncItems,
    super.autoValidateMode,
    super.clearButtonProps,
    super.compareFn,
    super.dropdownButtonProps,
    super.enabled,
    super.filterFn,
    super.itemAsString,
    super.onBeforeChange,
    super.onBeforePopupOpening,
    super.onChanged,
    super.onSaved,
    super.validator,
    this.label,
  }) : super(
          selectedItem: selected == null
              ? items[0]
              : items.firstWhere((element) => element.value == selected),
          dropdownBuilder: (context, selectedItem) {
            return Text(selectedItem!.name);
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              label: Text(label ?? ""),
              border: const OutlineInputBorder(),
            ),
          ),
          popupProps: PopupProps.menu(
            itemBuilder: (context, item, isSelected) {
              return Text(item.name);
            },
          ),
        );
}
