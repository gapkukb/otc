import 'package:flutter/material.dart';

const _xs = 576;
const _sm = 768;
const _md = 920;
const _lg = 1200;
const _xl = 1440;

// 移动端优先

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
    T? xxl,
  }) {
    final w = MediaQuery.of(this).size.width;

    if (w < _xs) return defaultVal;
    if (w < _sm) return sm ?? defaultVal;
    if (w < _md) return md ?? sm ?? defaultVal;
    if (w < _lg) return lg ?? md ?? sm ?? defaultVal;
    if (w < _xl) return xl ?? lg ?? md ?? sm ?? defaultVal;

    return xxl ?? xl ?? lg ?? md ?? sm ?? defaultVal;
  }
}

extension Size on BuildContext {
  double fixedHeight(double defaultVal) {
    final w = MediaQuery.of(this).size.width;

    return w / defaultVal;
  }
}
