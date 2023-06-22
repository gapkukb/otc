import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  static List<dynamic> items = [
    {
      "title": "总览",
      "icon": Icons.account_circle,
      'path': "/",
    },
    {
      "title": "C2C用户中心",
      "icon": Icons.face,
      'handler': () {},
    },
    {
      "title": "返佣",
      "icon": Icons.paid,
      'handler': () {},
    },
    {
      "title": "任务中心",
      "icon": Icons.calendar_month,
      'handler': () {},
    },
    {
      "title": "账户安全",
      "icon": Icons.security,
      'handler': () {},
    },
    {
      "title": "身份认证",
      "icon": Icons.admin_panel_settings,
      'handler': () {},
    },
    {
      "title": "做市商认证",
      "icon": Icons.people,
      'handler': () {},
    },
    {
      "title": "设置",
      "icon": Icons.settings,
      'handler': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      // itemExtent: 40,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          onTap: () {
            if (item['path'] != null) return context.go(item['path']);
            item['handler']();
          },
          title: Text(item['title']),
          leading: Icon(item['icon']),
        );
      },
    );
  }
}
