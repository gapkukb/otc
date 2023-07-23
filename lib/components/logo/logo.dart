import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/components/gap/gap.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.logo1.svg(
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
          if (withLogoText == true) const Gap.small(horizition: true),
          if (withLogoText == true)
            Assets.images.logo2.svg(
              height: 20,
              colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha(170), BlendMode.srcIn),
            )
        ],
      ),
    );
  }
}
