import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/layout/layout.menu.dart';
import 'package:otc/components/layout/layout.menu.item.dart';
import 'package:otc/components/layout/layout.menu.sub.dart';
import 'package:otc/global/global.dart';
import 'package:otc/router/router.dart';

ShellRouteBuilder merchantLayout = (context, state, child) {
  return Material(
    color: const Color(0xffF8F9FA),
    child: Row(
      children: [
        SidebarMenu(
          items: [
            LayoutMenuSub(
              title: "代理系统",
              underline: false,
              items: [
                const LayoutMenuItem(
                  name: "仪表盘",
                  path: Routes.merchantDashboard,
                ),
                const LayoutMenuItem(
                  name: "佣金明细",
                  path: Routes.merchantIncome,
                ),
                const LayoutMenuItem(
                  name: "下级邀请码",
                  path: Routes.merchantInvitation,
                ),
                if (global.user.base.type == "AGENT_LV_1")
                  const LayoutMenuItem(
                    name: "佣金比例设置",
                    path: Routes.merchantSetting,
                  ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Material(
            color: Colors.grey.shade100,
            // padding: Pads.sm,
            child: child,
          ),
        ),
      ],
    ),
  );
};
