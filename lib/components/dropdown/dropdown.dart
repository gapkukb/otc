import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_empty_view.dart';

export 'package:dropdown_search/dropdown_search.dart' show PopupProps;

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
  final Widget? leading;
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
    this.leading,
  });
}

class Dropdown extends StatefulWidget {
  final Map<String, dynamic>? formState;
  final String name;
  final bool showSearchBox;
  final String? searchHintText;
  final String? labelText;
  final List<DropdownItem> data;
  final Widget? title;
  final DropdownType type;
  final InputDecoration inputDecoration;
  final Widget? prefixIcon;
  final Widget Function(BuildContext context, DropdownItem item, Widget widget)? itemBuilder;
  final PopupProps? props;
  final dynamic initialValue;
  final Widget? Function(BuildContext, DropdownItem?)? dropdownBuilder;
  final String? Function(DropdownItem?)? validator;
  const Dropdown({
    super.key,
    required this.name,
    this.formState,
    this.showSearchBox = false,
    this.searchHintText,
    this.labelText,
    this.title,
    this.data = const [],
    this.type = DropdownType.menu,
    this.inputDecoration = const InputDecoration(),
    this.prefixIcon,
    this.itemBuilder,
    this.props,
    this.initialValue,
    this.dropdownBuilder,
    this.validator,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  DropdownItem? selectedItem;

  @override
  void initState() {
    selectedItem = widget.data.firstWhere((element) => element.value == widget.initialValue || element.title == widget.initialValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("data");
    return DropdownSearch<DropdownItem>(
      items: widget.data,
      // selectedItem: selectedItem,
      onSaved: (now) {
        final $value = now?.value ?? now?.title;
        widget.formState?.update(widget.name, (val) => val, ifAbsent: () => $value);
      },
      dropdownBuilder: widget.dropdownBuilder,
      validator: widget.validator,
      onChanged: (now) {
        selectedItem = now;
      },
      popupProps: (widget.type == DropdownType.menu
          ? PopupProps.menu
          : widget.type == DropdownType.dialog
              ? PopupProps.dialog
              : widget.type == DropdownType.bottomSheet
                  ? PopupProps.bottomSheet
                  : PopupProps.modalBottomSheet)(
        fit: FlexFit.loose,
        title: widget.title,
        footnote: widget.props?.footnote,
        itemBuilder: (context, item, isSelected, disabled) {
          Widget? gen(Widget? widget, String? text, TextStyle? style) {
            if (widget != null) return widget;
            if (text != null) {
              return Text(text, style: style);
            }
            return null;
          }

          final view = ListTile(
            tileColor: disabled ? Colors.grey.shade100 : null,
            leading: item.leading,
            title: gen(item.titleWidget, item.title, item.titleStyle),
            trailing: gen(item.trailingWidget, item.trailing, item.trailingStyle),
            subtitle: gen(item.subtitleWidget, item.subtitle, item.subtitleStyle),
          );

          return widget.itemBuilder == null ? widget : widget.itemBuilder!(context, item, view);
        },

        emptyBuilder: widget.props?.emptyBuilder ??
            (context, searchEntry) {
              return const UiEmptyView(
                title: "未匹配到结果",
                subtitle: "换个关键词试试吧",
              );
            },
        errorBuilder: widget.props?.errorBuilder ??
            (context, searchEntry, exception) {
              return const UiEmptyView(
                title: "出错了",
                subtitle: "网络故障，请稍后再试",
              );
            },
        containerBuilder: widget.props?.containerBuilder ??
            (context, popupWidget) => Material(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  child: popupWidget,
                ),
        // dialogProps: DialogProps(),
        searchFieldProps: widget.props?.searchFieldProps ??
            TextFieldProps(
              decoration: InputDecoration(
                hintText: widget.searchHintText,
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                ),
              ),
            ),
        // showSelectedItems: true,
        showSearchBox: widget.props?.showSearchBox ?? widget.showSearchBox,
        searchDelay: widget.props?.searchDelay ?? const Duration(microseconds: 0),
        disabledItemFn: widget.props?.disabledItemFn,
      ),
      itemAsString: (item) {
        return item.title;
      },
      dropdownButtonProps: const DropdownButtonProps(
        icon: Icon(Icons.keyboard_arrow_down_outlined),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: widget.inputDecoration.copyWith(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
        ),
        baseStyle: Font.medium,
      ),
    );
  }
}
