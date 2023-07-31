import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
            child: CarouselSlider.builder(
              disableGesture: true,
              options: CarouselOptions(
                autoPlay: true,
                scrollDirection: Axis.vertical,
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
              ),
              itemCount: 15,
              itemBuilder: (context, itemIndex, pageViewIndex) => Container(
                // height: 30,
                child: Text("测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字"),
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
