import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_empty_view.dart';

enum DropdownType {
  menu,
  dialog,
  bottomSheet,
  modalBottomSheet,
}

class DropdownItem {
  final String title;
  final TextStyle? titleStyle;
  final Widget? titleWidget;
  final dynamic value;
  final String? trailing;
  final TextStyle? trailingStyle;
  final Widget? trailingWidget;
  final dynamic extra;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? subtitleWidget;
  final bool? disabled;

  DropdownItem({
    required this.title,
    this.value,
    this.trailing,
    this.extra,
    this.subtitle,
    this.titleWidget,
    this.trailingWidget,
    this.subtitleWidget,
    this.disabled,
    this.titleStyle,
    this.trailingStyle,
    this.subtitleStyle,
  });
}

class Dropdown extends DropdownSearch<DropdownItem> {
  final Map<String, dynamic>? formState;
  final String name;
  final bool showSearchBox;
  final String? searchHintText;
  final String? labelText;
  final List<DropdownItem> data;
  final Widget? title;
  final DropdownType type;
  final InputDecoration inputDecoration;
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
    this.formState,
    this.showSearchBox = false,
    this.searchHintText,
    this.labelText,
    this.title,
    this.data = const [],
    this.type = DropdownType.menu,
    this.inputDecoration = const InputDecoration(),
  }) : super(
          items: data,
          onSaved: (now) {
            final $value = now?.value ?? now?.title;
            formState?.update(name, (val) => val, ifAbsent: () => $value);
          },
          popupProps: (type == DropdownType.menu
              ? PopupProps.menu
              : type == DropdownType.dialog
                  ? PopupProps.dialog
                  : type == DropdownType.bottomSheet
                      ? PopupProps.bottomSheet
                      : PopupProps.modalBottomSheet)(
            fit: FlexFit.loose,
            title: title,
            itemBuilder: (context, item, isSelected) {
              Widget? gen(Widget? widget, String? text, TextStyle? style) {
                if (widget != null) return widget;
                if (text != null) {
                  return Text(
                    text,
                    style: style,
                  );
                }
                return null;
              }

              return ListTile(
                title: gen(item.titleWidget, item.title, item.titleStyle),
                trailing:
                    gen(item.trailingWidget, item.trailing, item.trailingStyle),
                subtitle:
                    gen(item.subtitleWidget, item.subtitle, item.subtitleStyle),
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
            dropdownSearchDecoration: inputDecoration.copyWith(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            baseStyle: const TextStyle(fontSize: 16),
          ),
        );
}
