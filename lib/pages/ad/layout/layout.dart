import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/layout/layout.menu.dart';
import 'package:otc/components/layout/layout.menu.item.dart';
import 'package:otc/components/layout/layout.menu.sub.dart';
import 'package:otc/router/router.dart';

ShellRouteBuilder advertiseLayout = (context, state, child) {
  return Material(
    color: Colors.white,
    child: Row(
      children: [
        const SidebarMenu(
          items: [
            LayoutMenuSub(
              title: "广告",
              underline: false,
              items: [
                LayoutMenuItem(
                  name: "买币",
                  path: Routes.adBuying,
                ),
                LayoutMenuItem(
                  name: "卖币",
                  path: Routes.adSelling,
                ),
                LayoutMenuItem(
                  name: "我的广告",
                  path: Routes.adOwn,
                ),
                LayoutMenuItem(
                  name: "历史广告",
                  path: Routes.adHistory,
                ),
                LayoutMenuItem(
                  name: "如何使用C2C",
                  path: Routes.course,
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Card(
            color: Colors.white,
            child: child,
          ),
        ),
      ],
    ),
  );
};
