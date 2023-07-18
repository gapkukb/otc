import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otc/theme/text_theme.dart';

class RechargeStepper extends StatelessWidget {
  final List<RechargeStep> steps;
  final int current;

  const RechargeStepper({
    super.key,
    this.steps = const [],
    this.current = 1,
  });

  @override
  Widget build(BuildContext context) {
    int i = 0;
    int j = 0;
    return Column(
      children: [
        Row(
          children: steps.map((item) {
            return Expanded(
              child: RechargeIndex(
                index: ++i,
                current: min(current, steps.length),
                max: steps.length,
              ),
            );
          }).toList(),
        ),
        Row(
          children: steps.map((item) {
            return DefaultTextStyle(
              style: TextStyle(
                color: ++j <= current ? Colors.green : Colors.grey,
              ),
              child: Expanded(child: item),
            );
          }).toList(),
        )
      ],
    );
  }
}

class RechargeStep extends StatelessWidget {
  final int? index;
  final String title;
  final String subtitle;
  final bool active;

  const RechargeStep({
    super.key,
    required this.title,
    required this.subtitle,
    this.index = 0,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        Text(
          title,
          style: Font.mediumBold,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Font.miniGrey,
        ),
      ],
    );
  }
}

class RechargeIndex extends StatelessWidget {
  final int index;
  final int current;
  final int max;

  const RechargeIndex({
    super.key,
    this.index = 0,
    this.current = 0,
    this.max = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            color: index == 1
                ? Colors.transparent
                : current >= index
                    ? Colors.green
                    : Colors.grey,
          ),
        ),
        Material(
          shape: const StadiumBorder(),
          color: current >= index ? Colors.green : Colors.grey,
          child: SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 2,
            color: index == max
                ? Colors.transparent
                : current > index
                    ? Colors.green
                    : Colors.grey,
          ),
        ),
      ],
    );
  }
}
