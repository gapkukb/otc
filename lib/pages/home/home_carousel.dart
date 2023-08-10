import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  List<Map<String, dynamic>> get items {
    return [
      {
        "image": Assets.images.image1,
      },
      {
        "image": Assets.images.image1,
      },
      {
        "image": Assets.images.image1,
      },
      {
        "image": Assets.images.image1,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 300 / 148,
        crossAxisCount: 4,
        crossAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset("assets/images/image_1.png"),
          ),
          onTap: () {},
        );
      },
    );
  }
}
