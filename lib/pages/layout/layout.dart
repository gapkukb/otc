import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/utils/responsive.dart';
import 'layout_app_bar.dart';
import 'layout_footer.dart';

ShellRouteBuilder layout = (context, state, child) {
  return SafeArea(
    child: Scaffold(
      appBar: appBar,
      body: context.responsive(
        child,
        lg: SelectionArea(child: child),
      ),
      // bottomNavigationBar: LayoutFooter()
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.abc),
      //       label: '123',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.abc),
      //       label: '123',
      //     ),
      //   ],
      // ),
    ),
  );
};
