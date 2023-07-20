import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/layout/layout.menu.dart';
import 'package:otc/components/layout/layout.menu.item.dart';
import 'package:otc/components/layout/layout.menu.sub.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/padding.dart';

ShellRouteBuilder agentSystemLayout = (context, state, child) {
  return Material(
    color: const Color(0xffF8F9FA),
    child: Row(
      children: [
        const Card(
          child: SidebarMenu(
            items: [
              LayoutMenuSub(
                title: "代理系统",
                underline: false,
                items: [
                  LayoutMenuItem(
                    name: "仪表盘11",
                    path: Routes.agentSystemDashboard,
                  ),
                  LayoutMenuItem(
                    name: "佣金明细",
                    path: Routes.agentSystemIncome,
                  ),
                  LayoutMenuItem(
                    name: "下级邀请码",
                    path: Routes.agentSystemHierarchy,
                  ),
                  LayoutMenuItem(
                    name: "佣金比例设置",
                    path: Routes.agentSystemSetting,
                  ),
                ],
              ),
            ],
          ),
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
