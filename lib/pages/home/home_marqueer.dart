import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import 'package:otc/widgets/ui_button.dart';

class HomeMarqueer extends StatefulWidget {
  const HomeMarqueer({super.key});

  @override
  State<HomeMarqueer> createState() => _HomeMarqueerState();
}

class _HomeMarqueerState extends State<HomeMarqueer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          const Icon(
            Icons.volume_up_outlined,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Marqueer(
              pps: 60,
              direction: MarqueerDirection.rtl,
              restartAfterInteractionDuration: const Duration(seconds: 6),
              restartAfterInteraction: false,
              infinity: false,
              autoStart: true,
              child: Text(
                List.generate(
                        1000, (index) => "jjjjjjjjjjjjjjjjjjjfdasfsdaffdf")
                    .join(""),
                style: const TextStyle(height: 1.5),
              ),
            ),
          ),
          const VerticalDivider(
            width: 19,
            thickness: 1,
          ),
          UiButton(
            variant: UiButtonVariant.text,
            size: UiButtonSize.mini,
            label: "查看更多",
            iconData: Icons.keyboard_arrow_right,
            iconOnRight: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
