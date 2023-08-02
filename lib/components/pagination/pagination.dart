import 'package:flutter/material.dart';
import 'package:otc/widgets/ui_button.dart';
import "dart:math" as math;

class Pagination extends StatelessWidget {
  final Function(int pageNo)? onChange;
  final int pageNo;
  final int pageSize;
  final int count;
  final bool? showOnSinglePage;
  const Pagination({
    super.key,
    this.onChange,
    this.pageNo = 1,
    this.pageSize = 0,
    this.count = 7,
    this.showOnSinglePage,
  });

  int get start {
    final num = math.max(pageNo - count ~/ 2, 0);

    return math.min(num, pageSize - count);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        UiButton(
          minWidth: 0,
          variant: UiButtonVariant.outline,
          onPressed: () {},
          iconData: Icons.keyboard_arrow_left_outlined,
        ),
        UiButton(
          minWidth: 0,
          variant: UiButtonVariant.outline,
          onPressed: () {},
          iconData: Icons.keyboard_arrow_left_outlined,
        ),
        ...List.generate(
          count,
          (index) {
            final page = start + index + 1;
            return UiButton(
              minWidth: 0,
              variant: page == index ? UiButtonVariant.filled : UiButtonVariant.outline,
              onPressed: () {},
              label: "$page",
            );
          },
        ),
        UiButton(
          minWidth: 0,
          variant: UiButtonVariant.outline,
          onPressed: () {},
          iconData: Icons.keyboard_arrow_right_outlined,
        ),
        UiButton(
          minWidth: 0,
          variant: UiButtonVariant.outline,
          onPressed: () {},
          iconData: Icons.keyboard_arrow_right_outlined,
        ),
      ],
    );
  }
}

// class PageButton extends MaterialButton {
//   PageButton():this.;
// }
