import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slider_captcha/slider_captcha.dart' as captcha;

class SliderCaptcha extends StatefulWidget {
  const SliderCaptcha({super.key});

  @override
  State<SliderCaptcha> createState() => _SliderCaptchaState();
}

class _SliderCaptchaState extends State<SliderCaptcha> {
  late captcha.SliderController controller;

  @override
  void initState() {
    controller = captcha.SliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      child: captcha.SliderCaptcha(
        controller: controller,
        image: Image.asset(
          'assets/images/efc12c8f9b0b13c844c7d6086dc4d1d5.jpg',
          fit: BoxFit.fill,
        ),
        colorBar: Colors.white,
        colorCaptChar: Colors.white,
        title: "拖动滑动到指定的位置",
        titleStyle: const TextStyle(
          fontSize: 14,
          decoration: TextDecoration.none,
          color: Colors.black,
        ),
        imageToBarPadding: 16,
        borderImager: 5,
        onConfirm: (value) {
          return Future.sync(() {
            if (value) {
              context.pop(true);
            } else {
              controller.create();
            }
          });
        },
      ),
    );
  }
}
