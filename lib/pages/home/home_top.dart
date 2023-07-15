import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/utils/responsive.dart';
import 'package:otc/widgets/ui_button.dart';

class HomeTop extends ConsumerWidget {
  const HomeTop({super.key});

  @override
  Widget build(context, ref) {
    final user = ref.watch(userProvider);

    if (context.md) {
      return Column(
        children: [
          Image.asset("assets/images/top-banner.png"),
          const SizedBox(height: 32),
          _buildText(context, user)
        ],
      );
    }

    return Container(
      height: 344,
      margin: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/top-banner.png"),
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerRight,
        ),
      ),
      child: _buildText(context, user),
    );
  }

  _buildText(BuildContext context, UserModel? user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: context.responsive(
        CrossAxisAlignment.center,
        md: CrossAxisAlignment.start,
      ),
      children: [
        Text(
          "开启加密货币之旅",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "在Mybit您可以安全便捷，口手续费买卖数字货币。",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        UiButton(
          label: "查看详情",
          iconData: Icons.keyboard_arrow_right_outlined,
          iconOnRight: true,
          size: UiButtonSize.medium,
          color: const Color(0xff2D68FE),
          onPressed: () {},
        ),
      ],
    );
  }
}
