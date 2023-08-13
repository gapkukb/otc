import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: RawGestureDetector(
        gestures: {
          SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(SerialTapGestureRecognizer.new, (SerialTapGestureRecognizer instance) {
            instance.onSerialTapDown = (SerialTapDownDetails details) {
              if (details.count == 4) {
                context.go(Routes.merchantDashboard);
              } else if (details.count == 1) {
                context.go(Routes.home);
              }
            };
          }),

          // if (global.user.base.type != "GENERAL")
          //   LongPressGestureRecognizer: GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
          //     () => LongPressGestureRecognizer(
          //       duration: const Duration(seconds: 3),
          //     ),
          //     (instance) {
          //       instance.onLongPress = () => context.go(Routes.agentDashboard);
          //     },
          //   ),
          TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
            () => TapGestureRecognizer(),
            (TapGestureRecognizer instance) {
              instance.onTap = () {
                context.go(Routes.home);
              };
            },
          ),
        },
        child: logo,
      ),
    );
  }
}
