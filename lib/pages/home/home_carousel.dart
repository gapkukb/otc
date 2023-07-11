import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:otc/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        height: 148.0,
        crossAxisCount: 4,
        crossAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              "assets/images/1.png",
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
