import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/layout/layout.menu.dart';
import 'package:otc/components/layout/layout.menu.item.dart';
import 'package:otc/components/layout/layout.menu.sub.dart';
import 'package:otc/router/router.dart';

ShellRouteBuilder userLayout = (context, state, child) {
  return Material(
    color: const Color(0xffF8F9FA),
    child: Row(
      children: [
        const SidebarMenu(
          items: [
            LayoutMenuSub(
              title: "钱包",
              underline: false,
              items: [
                LayoutMenuItem(
                  name: "总览",
                  path: Routes.user,
                ),
                LayoutMenuItem(
                  name: "C2C用户中心",
                  path: Routes.c2c,
                ),
                LayoutMenuItem(
                  name: "返佣",
                  path: Routes.rebate,
                ),
                LayoutMenuItem(
                  name: "任务中心",
                  path: Routes.tasks,
                ),
                LayoutMenuItem(
                  name: "账户安全",
                  path: Routes.security,
                ),
                LayoutMenuItem(
                  name: "身份认证",
                  path: Routes.auth,
                ),
                LayoutMenuItem(
                  name: "做市商认证",
                  path: Routes.merchant,
                ),
                LayoutMenuItem(
                  name: "设置",
                  path: Routes.setting,
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: child,
        ),
      ],
    ),
  );
};
