import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const _xs = 576;
const _sm = 768;
const _md = 992;
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
    if (width < _xs) return defaultVal;
    if (width < _sm) return sm ?? defaultVal;
    if (width < _md) return md ?? sm ?? defaultVal;
    if (width < _lg) return lg ?? md ?? sm ?? defaultVal;
    if (width < _xl) return xl ?? lg ?? md ?? sm ?? defaultVal;

    return xxl ?? xl ?? lg ?? md ?? sm ?? defaultVal;
  }

  get width {
    return MediaQuery.of(this).size.width;
  }

  get xs {
    return width < _xs;
  }

  get sm {
    return width < _sm;
  }

  get md {
    return width < _md;
  }

  get lg {
    return width > _lg;
  }

  get xl {
    return width > _xl;
  }
}

extension Size on BuildContext {
  double fixedHeight(double defaultVal) {
    final w = MediaQuery.of(this).size.width;

    return w / defaultVal;
  }
}
