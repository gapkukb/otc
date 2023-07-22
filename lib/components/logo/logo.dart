import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';

class Logo extends StatelessWidget {
  final bool? withLogoText;
  final VoidCallback? onPressed;
  final double? size;
  const Logo({
    super.key,
    this.withLogoText = true,
    this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(size ?? 56),
      child: Row(
        children: [
          Assets.images.logo1.svg(
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          if (withLogoText == true)
            Assets.images.logo2.svg(
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )
        ],
      ),
    );
  }
}
