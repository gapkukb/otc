import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/global/global.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';

class LayoutLogo extends StatelessWidget {
  const LayoutLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: Pads.leftLg,
      child: Assets.images.logo.image(),
    );

    if (global.user.base.type == "GENERAL") return logo;
    return RawGestureDetector(
      gestures: {
        LongPressGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          () => LongPressGestureRecognizer(
            debugOwner: this,
            duration: const Duration(seconds: 5),
          ),
          (instance) {
            instance.onLongPress = () => context.go(Routes.agentDashboard);
          },
        ),
      },
      child: logo,
    );
  }
}
