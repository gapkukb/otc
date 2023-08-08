import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/widgets/ui_button.dart';
import "dart:math" as math;

bool _locked = false;

class Pagination extends StatelessWidget {
  final void Function(int current) onChange;
  final int pageNo;
  final int pageCount;
  final int count;
  final bool? showOnSinglePage;
  final bool? disabled;
  final bool? isDense;
  const Pagination({
    super.key,
    required this.onChange,
    this.pageNo = 1,
    this.pageCount = 1,
    this.count = 5,
    this.showOnSinglePage,
    this.disabled,
    this.isDense,
  });

  int get length {
    return math.min(count, pageCount);
  }

  int get start {
    if (length == pageCount) return 0;
    final num = math.max(pageNo - length / 2, 0).toInt();
    return math.min(num, length);
  }

  @override
  Widget build(BuildContext context) {
    if (pageCount <= 1) return const SizedBox.shrink();
    return Padding(
      padding: isDense == true ? Pads.yAxisXs : Pads.yAxisSm,
      child: Wrap(
        spacing: isDense == true ? 4 : 8,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _PageButton(
            disabled: pageNo <= 1,
            onPressed: changeHandler(1),
            iconData: Icons.first_page_outlined,
            isDense: isDense,
          ),
          _PageButton(
            disabled: pageNo <= 1,
            onPressed: changeHandler(pageNo - 1),
            iconData: Icons.keyboard_arrow_left_outlined,
            isDense: isDense,
          ),
          ...List.generate(
            length,
            (index) {
              final page = start + index + 1;
              return _PageButton(
                variant: page == pageNo ? UiButtonVariant.filled : UiButtonVariant.outline,
                onPressed: changeHandler(page),
                label: "$page",
                isDense: isDense,
              );
            },
          ),
          _PageButton(
            onPressed: changeHandler(pageNo + 1),
            disabled: pageNo >= pageCount,
            iconData: Icons.keyboard_arrow_right_outlined,
            isDense: isDense,
          ),
          _PageButton(
            onPressed: changeHandler(pageCount),
            disabled: pageNo >= pageCount,
            iconData: Icons.last_page_outlined,
            isDense: isDense,
          ),
        ],
      ),
    );
  }

  changeHandler(int pageNo) {
    return () {
      if (disabled == true) return;
      onChange(pageNo);
    };
  }
}

class _PageButton extends UiButton {
  final bool? isDense;
  const _PageButton({
    required super.onPressed,
    super.variant = UiButtonVariant.outline,
    super.disabled,
    super.iconData,
    super.label,
    this.isDense,
  }) : super(
          minWidth: isDense == true ? 24 : 32,
          height: isDense == true ? 24 : 32,
          padding: const EdgeInsets.symmetric(horizontal: 4),
        );
}
