import 'package:flutter/material.dart';

class CaptchaF2a extends StatefulWidget {
  const CaptchaF2a({super.key});

  @override
  State<CaptchaF2a> createState() => _CaptchaF2aState();
}

class _CaptchaF2aState extends State<CaptchaF2a> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        child: Stack(children: []),
      ),
    );
  }
}
