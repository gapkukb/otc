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

class UiFlex2<T extends dynamic> extends StatelessWidget {
  final List<T> data;
  final Widget Function(T item, int index) itemBuilder;
  const UiFlex2({
    super.key,
    this.data = const [],
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      direction: context.responsive(
        Axis.vertical,
        md: Axis.horizontal,
      ),
      children:
          List.generate(data.length, (index) => itemBuilder(data[index], index))
              .map((e) {
        return context.responsive(
          e,
          md: Expanded(child: e),
        );
      }).toList(),
    );
  }
}
