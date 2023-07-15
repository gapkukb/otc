import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';

class Page404 extends StatefulWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  State<Page404> createState() => _Page404State();
}

class _Page404State extends State<Page404> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/images/404.svg",
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
              fit: BoxFit.cover,
              width: 300,
            ),
            const Text(
              "很抱歉，您访问的页面出错了",
              style: Font.largeBold,
            ),
            const SizedBox(height: 8),
            const Text(
              "您访问的资源不存在或者已被移除",
              style: Font.smallGrey,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiButton(
                  iconData: Icons.keyboard_arrow_left_outlined,
                  label: "返回",
                  onPressed: () {
                    if (context.canPop()) context.pop();
                  },
                ),
                const SizedBox(width: 16),
                UiButton(
                  iconData: Icons.home,
                  label: "回到首页",
                  onPressed: () {
                    context.goNamed(Routes.home);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
