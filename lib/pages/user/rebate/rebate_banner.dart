import 'package:flutter/material.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/widgets/ui_button.dart';

class RebateBanner extends StatelessWidget {
  const RebateBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 387,
      padding: const EdgeInsets.only(left: 64.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          image: Assets.images.rebate.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "加入Maoerduo做市商联盟，可获得",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "挂单成交额度xx%的佣金",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.red),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              UiButton(
                size: UiButtonSize.medium,
                color: Colors.black,
                label: "立即加入",
                onPressed: () {},
              ),
              const SizedBox(width: 24),
              UiButton(
                size: UiButtonSize.medium,
                color: Colors.white,
                label: "邀请好友",
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
