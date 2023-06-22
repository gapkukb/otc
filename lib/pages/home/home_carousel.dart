import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 148,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.network(
              "http://via.placeholder.com/288x188",
              fit: BoxFit.fill,
            ),
            onTap: () {
              print(index);
            },
          );
        },
        itemCount: 10,
        viewportFraction: 0.8,
        scale: 0.9,
        loop: false,
      ),
    );
  }
}
