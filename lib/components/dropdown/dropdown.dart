import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_empty_view.dart';
import 'package:nil/nil.dart';

class DropdownItem {
  final String title;
  final dynamic value;
  final String? trailing;
  final dynamic extra;
  final String? subtitle;

  DropdownItem({
    required this.title,
    this.value,
    this.trailing,
    this.extra,
    this.subtitle,
  });
}

class Dropdown extends DropdownSearch<DropdownItem> {
  final Map<String, dynamic>? formStore;
  final String name;
  final bool showSearchBox;
  final String? searchHintText;
  final String? labelText;
  final List<DropdownItem> data;

  Dropdown({
    super.key,
    super.asyncItems,
    super.autoValidateMode,
    super.clearButtonProps,
    super.compareFn,
    super.dropdownBuilder,
    // super.dropdownButtonProps,
    super.enabled,
    super.filterFn,
    super.onBeforeChange,
    super.onBeforePopupOpening,
    super.selectedItem,
    super.validator,
    required this.name,
    this.formStore,
    this.showSearchBox = true,
    this.searchHintText,
    this.labelText,
    this.data = const [],
  }) : super(
          items: data,
          onSaved: (now) {
            final $value = now?.value ?? now?.title;
            formStore?.update(name, (val) => val, ifAbsent: $value);
          },
          popupProps: PopupProps.dialog(
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(item.title),
                trailing: item.trailing == null ? null : Text(item.trailing!),
                subtitle: item.subtitle == null ? null : Text(item.subtitle!),
              );
            },
            emptyBuilder: (context, searchEntry) {
              return const UiEmptyView(
                title: "未匹配到结果",
                subtitle: "换个关键词试试吧",
              );
            },
            errorBuilder: (context, searchEntry, exception) {
              return const UiEmptyView(
                title: "出错了",
                subtitle: "网络故障，请稍后再试",
              );
            },
            containerBuilder: (context, popupWidget) => Material(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              child: popupWidget,
            ),
            // dialogProps: DialogProps(),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: searchHintText,
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                ),
              ),
            ),
            // showSelectedItems: true,
            showSearchBox: showSearchBox,
            searchDelay: const Duration(microseconds: 0),
          ),
          itemAsString: (item) {
            return item.title;
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            baseStyle: const TextStyle(fontSize: 16),
          ),
        );
}
