import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nil/nil.dart';
import 'package:otc/router/route_name.dart';
import 'package:otc/router/router.keys.dart';
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
        onPressed: () {},
      ),
      _MenuData(
        title: "卖币",
        subTitle: "以当地货币收款",
        onPressed: () {},
      ),
      _MenuData(
        title: "我的广告",
        subTitle: "在此管理广告",
        onPressed: () {},
      ),
    ],
  ),
  _MenuDatas(
    title: "行情",
    children: [
      _MenuData(
        title: "买币",
        subTitle: "支持当地银行和数字钱包充值",
        onPressed: () {},
      ),
      _MenuData(
        title: "卖币",
        subTitle: "以当地货币收款",
        onPressed: () {},
      ),
      _MenuData(
        title: "我的广告",
        subTitle: "在此管理广告",
        onPressed: () {},
      ),
    ],
  ),
  _MenuDatas(
    title: "交易",
    children: [
      _MenuData(
        title: "买币",
        subTitle: "支持当地银行和数字钱包充值",
        onPressed: () {},
      ),
      _MenuData(
        title: "卖币",
        subTitle: "以当地货币收款",
        onPressed: () {},
      ),
      _MenuData(
        title: "我的广告",
        subTitle: "在此管理广告",
        onPressed: () {},
      ),
    ],
  ),
];

class LayoutHeader extends AppBar {
  LayoutHeader({
    super.key,
  }) : super(
          primary: false,
          leading: Padding(
            padding: Pads.leftLg,
            child: Image.asset("assets/images/logo.png"),
          ),
          leadingWidth: 80,
          automaticallyImplyLeading: false,
          shadowColor: Colors.grey.shade100,
          // forceMaterialTransparency: true,
          elevation: 1,
          surfaceTintColor: Colors.white,
          scrolledUnderElevation: 1,
          title: Row(
            children: [
              MenuBar(
                style: MenuStyle(
                  backgroundColor: _color,
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.zero,
                  ),
                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                ),
                children: _menus.map((menu) {
                  return _SubMenu(
                    menuChildren: menu.children
                        .map(
                          (item) => _MenuItem(
                            title: item.title,
                            subTitle: item.subTitle,
                            onPressed: () {
                              _router.go('/login');
                            },
                          ),
                        )
                        .toList(),
                    child: UiChip(
                      iconOnRight: true,
                      icon: Icons.keyboard_arrow_down_outlined,
                      iconSize: 20,
                      spacing: 2,
                      text: menu.title,
                      textStyle: Font.small,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
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
            const SizedBox(width: 16),
          ],
        );
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
  _MenuItem({
    required this.title,
    required this.subTitle,
    super.onPressed,
  }) : super(
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
  final VoidCallback onPressed;

  const _MenuData({
    required this.title,
    required this.subTitle,
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
