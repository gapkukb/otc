import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/layout/layout.menu.dart';
import 'package:otc/components/layout/layout.menu.item.dart';
import 'package:otc/components/layout/layout.menu.sub.dart';
import 'package:otc/router/router.dart';

ShellRouteBuilder walletLayout = (context, state, child) {
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
                  name: "钱包总览",
                  path: Routes.wallet,
                ),
                LayoutMenuItem(
                  name: "收款方式",
                  path: Routes.walletMethod,
                ),
                LayoutMenuItem(
                  name: "资金钱包",
                  path: Routes.walletFunds,
                ),
                LayoutMenuItem(
                  name: "现货钱包",
                  path: Routes.walletSpot,
                ),
                LayoutMenuItem(
                  name: "合约钱包",
                  path: Routes.walletFutures,
                ),
                LayoutMenuItem(
                  name: "历史记录",
                  path: Routes.walletHistory,
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
