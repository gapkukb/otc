import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

class UiFlex extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final List<Widget> children;

  const UiFlex({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children.map((child) {
        return Flexible(
          fit: context.responsive(FlexFit.loose, md: FlexFit.tight),
          child: child,
        );
      }).toList(),
    );
  }

  Widget _box({
    required BuildContext context,
    required Flex child,
  }) {
    return context.responsive(
      child,
      md: child,
    );
  }
}
