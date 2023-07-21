import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/menu/menu.dart';
import 'package:otc/layout/layout.logo.dart';
import 'package:otc/layout/layout.profile.dart';
import 'package:otc/pages/notice/notice_appbar.dart';
import 'package:otc/providers/auth.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_chip.dart';

final _color = MaterialStateColor.resolveWith((states) => Colors.transparent);
final _router = GoRouter.of(navigatorKey.currentContext!);

final List<_MenuDatas> _menus = [
  _MenuDatas(
    title: "买/卖数字货币",
    children: [
      _MenuData(
        title: "买币",
        subTitle: "支持当地银行和数字钱包充值",
        icon: Icons.wallet_outlined,
        onPressed: () {},
      ),
      _MenuData(
        title: "卖币",
        subTitle: "以当地货币收款",
        icon: Icons.credit_card_rounded,
        onPressed: () {},
      ),
      _MenuData(
        title: "我的广告",
        subTitle: "在此管理广告",
        icon: Icons.ads_click_outlined,
        onPressed: () {},
      ),
    ],
  ),
  // _MenuDatas(
  //   title: "行情",
  //   children: [
  //     _MenuData(
  //       title: "买币",
  //       subTitle: "支持当地银行和数字钱包充值",
  //       onPressed: () {},
  //     ),
  //     _MenuData(
  //       title: "卖币",
  //       subTitle: "以当地货币收款",
  //       onPressed: () {},
  //     ),
  //     _MenuData(
  //       title: "我的广告",
  //       subTitle: "在此管理广告",
  //       onPressed: () {},
  //     ),
  //   ],
  // ),
  // _MenuDatas(
  //   title: "交易",
  //   children: [
  //     _MenuData(
  //       title: "买币",
  //       subTitle: "支持当地银行和数字钱包充值",
  //       onPressed: () {},
  //     ),
  //     _MenuData(
  //       title: "卖币",
  //       subTitle: "以当地货币收款",
  //       onPressed: () {},
  //     ),
  //     _MenuData(
  //       title: "我的广告",
  //       subTitle: "在此管理广告",
  //       onPressed: () {},
  //     ),
  //   ],
  // ),
];

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
      leadingWidth: 80,
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
            items: [
              MenuItem(
                title: "title",
                subtitle: "item.subTitle",
                icon: Icons.credit_card_outlined,
              ),
              MenuItem(
                title: "title",
                subtitle: "item.subTitle",
                icon: Icons.credit_card_outlined,
              ),
              MenuItem(
                title: "title",
                subtitle: "item.subTitle",
                icon: Icons.credit_card_outlined,
              ),
            ],
            surfaceTintColor: Colors.white,
            padding: EdgeInsets.zero,
          )

          // MenuBar(
          //   style: MenuStyle(
          //     backgroundColor: _color,
          //     padding: MaterialStateProperty.resolveWith(
          //       (states) => EdgeInsets.zero,
          //     ),
          //     elevation: MaterialStateProperty.resolveWith((states) => 0),
          //   ),
          //   children: _menus.map(
          //     (menu) {
          //       return _SubMenu(
          //         menuChildren: menu.children
          //             .map(
          //               (item) => _MenuItem(
          //                 title: item.title,
          //                 subTitle: item.subTitle,
          //                 icon: item.icon,
          //                 onPressed: () {
          //                   _router.go('/login');
          //                 },
          //               ),
          //             )
          //             .toList(),
          //         child: UiChip(
          //           iconOnRight: true,
          //           icon: Icons.keyboard_arrow_down_outlined,
          //           iconSize: 20,
          //           spacing: 2,
          //           text: menu.title,
          //           textStyle: Font.small,
          //         ),
          //       );
          //     },
          //   ).toList(),
          // ),
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
            _router.goNamed(Routes.order);
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
      )
    ];
  }
}

class _SubMenu extends SubmenuButton {
  _SubMenu({
    required super.menuChildren,
    required super.child,
  }) : super(
          menuStyle: MenuStyle(
            shadowColor:
                MaterialStateColor.resolveWith((states) => Colors.grey),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            surfaceTintColor: _color,
            elevation: MaterialStateProperty.resolveWith(
              (states) => 10,
            ),
          ),
        );
}

class _MenuItem extends MenuItemButton {
  final String title;
  final String subTitle;
  final IconData icon;
  _MenuItem({
    required this.title,
    required this.subTitle,
    required this.icon,
    super.onPressed,
  }) : super(
          leadingIcon: Material(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(icon),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: Font.small,
              ),
              Text(
                subTitle,
                style: Font.miniGrey,
              ),
            ],
          ),
        );
}

class _MenuData {
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onPressed;

  const _MenuData({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onPressed,
  });
}

class _MenuDatas {
  final String title;
  final List<_MenuData> children;

  const _MenuDatas({
    required this.title,
    required this.children,
  });
}
