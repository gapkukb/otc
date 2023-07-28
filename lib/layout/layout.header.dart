import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/menu/menu.dart';
import 'package:otc/layout/layout.logo.dart';
import 'package:otc/layout/layout.profile.dart';
import 'package:otc/pages/notice/notice_appbar.dart';
import 'package:otc/router/router.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/providers/user.provider.dart';

final _color = MaterialStateColor.resolveWith((states) => Colors.transparent);
final _router = GoRouter.of(navigatorKey.currentContext!);

class LayoutHeader extends ConsumerWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const LayoutHeader({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(context, ref) {
    final isAuthed = ref.watch(authProvider);
    return AppBar(
      primary: false,
      leading: const LayoutLogo(),
      leadingWidth: 270,
      automaticallyImplyLeading: false,
      shadowColor: Colors.grey.shade100,
      // forceMaterialTransparency: true,
      elevation: 1,
      surfaceTintColor: Colors.white,
      scrolledUnderElevation: 1,
      title: Row(
        children: [
          Menu(
            text: "买/卖数字货币",
            onSelected: (value) {
              context.go(value);
            },
            items: const [
              MenuItem(
                title: "买币",
                subtitle: "支持当地银行和数字钱包充值",
                icon: Icons.credit_card_outlined,
                value: Routes.adBuying,
              ),
              MenuItem(
                title: "卖币",
                subtitle: "以当地货币收款",
                icon: Icons.wallet_outlined,
                value: Routes.adSelling,
              ),
              MenuItem(
                title: "我的广告",
                subtitle: "在此管理广告",
                icon: Icons.ads_click_outlined,
                value: Routes.adOwn,
              ),
            ],
          )
        ],
      ),
      actions: _buildActions(isAuthed),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  List<Widget> _buildActions(bool isAuthed) {
    if (isAuthed) {
      return [
        IconButton(
          icon: const Icon(Icons.credit_card_outlined),
          onPressed: () {
            _router.go(Routes.wallet);
          },
        ),
        IconButton(
          icon: const Icon(Icons.description_outlined),
          onPressed: () {
            _router.go(Routes.walletHistory);
          },
        ),
        const NoticeAppbar(),
        const LayoutProfile(userName: "user"),
      ];
    }

    return [
      UiButton(
        label: "登录",
        variant: UiButtonVariant.text,
        onPressed: () {
          _router.go('/login');
        },
      ),
      UiButton(
        label: "注册",
        onPressed: () {
          _router.go('/register');
        },
      ),
      const SizedBox(width: 32),
    ];
  }
}
