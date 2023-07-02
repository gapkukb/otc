import 'package:flutter/material.dart';

class SplashGuide extends StatefulWidget {
  const SplashGuide({Key? key}) : super(key: key);

  @override
  State<SplashGuide> createState() => _SplashGuideState();
}

class _SplashGuideState extends State<SplashGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_swiper'),
      ),
      body: Container(),
    );
  }
}
