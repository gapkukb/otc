import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/global/global.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/components/logo/logo.dart';

class LayoutLogo extends StatelessWidget {
  const LayoutLogo({super.key});

  @override
  Widget build(BuildContext context) {
    const logo = Padding(
      padding: Pads.leftLg,
      child: Logo(),
    );

    if (global.user.base.type == "GENERAL") {
      return GestureDetector(
        child: logo,
        onTap: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.home, (route) => false);
        },
      );
    }
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
