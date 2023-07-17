import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/layout/layout.menu.dart';
import 'package:otc/components/layout/layout.menu.item.dart';
import 'package:otc/components/layout/layout.menu.sub.dart';
import 'package:otc/router/router.dart';

ShellRouteBuilder orderLayout = (context, state, child) {
  return Row(
    children: [
      const SidebarMenu(
        items: [
          LayoutMenuSub(
            title: "订单记录",
            items: [
              LayoutMenuItem(
                name: "C2C订单",
                path: Routes.order,
              ),
            ],
          ),
          LayoutMenuSub(
            title: "现货",
            items: [
              LayoutMenuItem(
                name: "当前委托",
                path: Routes.pendingSpotOrder,
              ),
              LayoutMenuItem(
                name: "历史委托",
                path: Routes.historySpotOrder,
              ),
              LayoutMenuItem(
                name: "历史成交",
                path: Routes.doneSpotOrder,
              ),
            ],
          ),
          LayoutMenuSub(
            underline: false,
            title: "合约",
            items: [
              LayoutMenuItem(
                name: "当前委托",
                path: Routes.pendingFutureOrder,
              ),
              LayoutMenuItem(
                name: "历史委托",
                path: Routes.historyFutureOrder,
              ),
              LayoutMenuItem(
                name: "历史成交",
                path: Routes.doneFutureOrder,
              ),
            ],
          )
        ],
      ),
      Expanded(
        child: child,
      ),
    ],
  );
};
