import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/asstes/assets.gen.dart';
import 'package:otc/models/otc/otc.model.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/providers/otc.provider.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';

class HomeTop extends ConsumerWidget {
  const HomeTop({super.key});

  @override
  Widget build(context, ref) {
    final user = ref.watch(userProvider);
    final otc = ref.watch(otcProvider);

    if (context.md) {
      return Column(
        children: [
          Assets.images.topBanner.image(),
          const SizedBox(height: 32),
          _buildText(context, user, otc),
        ],
      );
    }

    return Container(
      height: 344,
      margin: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.topBanner.provider(),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
        ),
      ),
      child: _buildText(context, user, otc),
    );
  }

  _buildText(BuildContext context, UserModel? user, OtcModel otc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: context.responsive(
        CrossAxisAlignment.center,
        md: CrossAxisAlignment.start,
      ),
      children: [
        const Text(
          "开启加密货币之旅",
          style: Font.x5largeBold,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "参与做市商扶持计划，可获得${otc.lowestCommission}%成交额返佣",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        UiButton(
          label: "查看详情",
          iconData: Icons.keyboard_arrow_right_outlined,
          iconOnRight: true,
          size: UiButtonSize.medium,
          color: const Color(0xff2D68FE),
          onPressed: () {
            context.push(Routes.merchantDashboard);
          },
        ),
      ],
    );
  }
}
