import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double size;
  final bool horizition;

  const Gap({
    super.key,
    required this.size,
    required this.horizition,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizition ? size : 0,
      height: horizition ? 0 : size,
    );
  }

  /// size = 8,
  const Gap.mini({super.key, bool? horizition})
      : size = 8,
        horizition = horizition ?? false;

  /// size = 16,
  const Gap.small({super.key, bool? horizition})
      : size = 16,
        horizition = horizition ?? false;

  /// size = 24,
  const Gap.medium({super.key, bool? horizition})
      : size = 24,
        horizition = horizition ?? false;

  /// size = 32,
  const Gap.large({super.key, bool? horizition})
      : size = 32,
        horizition = horizition ?? false;

  /// size = 40,
  const Gap.xlarge({super.key, bool? horizition})
      : size = 40,
        horizition = horizition ?? false;
}
