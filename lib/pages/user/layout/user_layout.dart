import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/layout/user.nav.list.dart';
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
        itemCount: UserNavList.values.length,
        itemBuilder: (context, index) {
          final item = UserNavList.values[index];
          final selected = currentPath == item.pathname;
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
              item.label,
              style: $style,
            ),
            trailing: Text(
              "100+",
              style: $style,
            ),
            onTap: item.go,
          );
        },
      ),
    );
  }
}
