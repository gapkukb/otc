import 'dart:developer';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_empty_view.dart';

export 'package:dropdown_search/dropdown_search.dart';

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
  final Mode mode;
  final InputDecoration inputDecoration;
  final Widget? prefixIcon;
  final Widget Function(BuildContext context, DropdownItem item, Widget widget)? itemBuilder;
  final PopupProps? props;
  final dynamic initialValue;
  final Widget? Function(BuildContext, DropdownItem?)? dropdownBuilder;
  final String? Function(DropdownItem?)? validator;
  final void Function(DropdownItem? selectedItem)? onChanged;
  final Future<List<DropdownItem>> Function(String text)? asyncItems;
  const Dropdown({
    super.key,
    required this.name,
    this.formState,
    this.showSearchBox = false,
    this.searchHintText,
    this.labelText,
    this.title,
    this.data = const [],
    this.mode = Mode.MENU,
    this.inputDecoration = const InputDecoration(),
    this.prefixIcon,
    this.itemBuilder,
    this.props,
    this.initialValue,
    this.dropdownBuilder,
    this.validator,
    this.onChanged,
    this.asyncItems,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  DropdownItem? selectedItem;

  @override
  void initState() {
    if (widget.initialValue != null) {
      selectedItem = widget.data.firstWhere((element) => element.value == widget.initialValue || element.title == widget.initialValue);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DropdownItem>(
      items: widget.data,
      selectedItem: selectedItem,
      onSaved: (now) {
        if (selectedItem == null) return;

        final $value = selectedItem?.value ?? selectedItem?.title;
        widget.formState?.update(widget.name, (_) => $value, ifAbsent: () => $value);
      },
      asyncItems: widget.asyncItems,
      dropdownBuilder: widget.dropdownBuilder,
      validator: widget.validator,
      onChanged: (now) {
        selectedItem = now;
        widget.onChanged?.call(now);
      },
      popupProps: props,
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

  PopupProps<DropdownItem> get baseProps {
    return PopupProps.menu(
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
          tileColor: disabled ? Colors.grey.shade100 : Colors.white,
          leading: item.leading,
          title: gen(item.titleWidget, item.title, item.titleStyle),
          trailing: gen(item.trailingWidget, item.trailing, item.trailingStyle),
          subtitle: gen(item.subtitleWidget, item.subtitle, item.subtitleStyle),
        );

        return widget.itemBuilder == null ? view : widget.itemBuilder!(context, item, view);
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
            inspect(exception);
            return const UiEmptyView(
              title: "出错了",
              subtitle: "网络故障，请稍后再试",
            );
          },
      // containerBuilder: widget.props?.containerBuilder ??
      //     (context, popupWidget) => Material(
      //           borderRadius: BorderRadius.circular(4),
      //           color: Colors.white,
      //           child: popupWidget,
      //         ),

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
    );
  }

  PopupProps<DropdownItem> get props {
    if (widget.mode == Mode.DIALOG) {
      return PopupProps.dialog(
        fit: baseProps.fit,
        title: baseProps.title,
        itemBuilder: baseProps.itemBuilder,
        emptyBuilder: baseProps.emptyBuilder,
        errorBuilder: baseProps.errorBuilder,
        searchFieldProps: baseProps.searchFieldProps,
        showSearchBox: baseProps.showSearchBox,
        searchDelay: baseProps.searchDelay,
        disabledItemFn: baseProps.disabledItemFn,
      );
    }
    return baseProps;
  }
}
