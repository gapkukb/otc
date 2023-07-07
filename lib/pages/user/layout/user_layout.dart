import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/layout/user_appbar.dart';
import 'package:otc/pages/user/layout/user_drawer.dart';
import 'package:otc/pages/user/layout/user_bottom_narbar.dart';
import 'package:otc/router/router.dart';
import 'package:otc/utils/responsive.dart';

ShellRouteBuilder userLayout = (context, state, child) {
  GlobalKey<_SidebarMenuState> _key = GlobalKey();

  return context.responsive(
    Scaffold(
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: UserDrawer(),
      ),
      appBar: userAppBar(),
      body: SafeArea(
        child: context.responsive(
          child,
          lg: SelectionArea(child: child),
        ),
      ),
      bottomNavigationBar: context.responsive(
        const UserBottomNarbar(),
        lg: const SizedBox.shrink(),
      ),
    ),
    lg: Scaffold(
      drawerEnableOpenDragGesture: false,
      body: Builder(
        builder: (ctx) {
          return Row(
            children: [
              SidebarMenu(
                key: _key,
              ),
              Expanded(
                child: Container(
                  color: Colors.purple.withAlpha(7),
                  padding: const EdgeInsets.all(32.0),
                  child: SelectionArea(child: child),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
};

class SidebarMenu extends StatefulWidget {
  double width = 336;

  SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleSmall;
    final currentPath = GoRouter.of(context).location;

    return SizedBox(
      width: 300,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final selected = currentPath == item['path'];
          final $style =
              !selected ? style : style!.copyWith(fontWeight: FontWeight.bold);

          return ListTile(
            enableFeedback: true,
            enabled: true,
            // tileColor: Colors.deepPurple.shade100,
            selectedTileColor: Colors.deepPurple.shade100,
            selected: selected,
            shape: const StadiumBorder(),
            leading: const Icon(
              Icons.fiber_manual_record,
              size: 18,
              color: Colors.black,
            ),
            title: Text(
              item['label'],
              style: $style,
            ),
            trailing: Text(
              "100+",
              style: $style,
            ),
            onTap: item['onTap'] ??
                () {
                  if (item['pathname'] == null) {
                    context.go(item['path']);
                  } else {
                    context.goNamed(item['pathname']);
                  }
                },
          );
        },
      ),
    );
  }

  static const List<Map<String, dynamic>> items = [
    {"label": "总览", "path": "/user"},
    {"label": "C2C用户中心", "path": "/c2c"},
    {"label": "返佣", "path": "/rebate"},
    {"label": "任务中心", "path": "/tasks"},
    {"label": "账户安全", "path": "/security"},
    {"label": "身份认证", "path": "/auth"},
    {"label": "做市商认证", "path": "/auth_agent"},
    {"label": "设置", "path": "/setting"},
  ];
}
