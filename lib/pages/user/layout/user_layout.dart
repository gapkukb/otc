import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/layout/user_appbar.dart';
import 'package:otc/pages/user/layout/user_drawer.dart';
import 'package:otc/pages/user/layout/user_bottom_narbar.dart';
import 'package:otc/utils/responsive.dart';

ShellRouteBuilder userLayout = (context, state, child) {
  GlobalKey<_AAAAState> _key = GlobalKey();

  return context.responsive(
    SafeArea(
      child: Scaffold(
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
        body: context.responsive(
          child,
          lg: SelectionArea(child: child),
        ),
        bottomNavigationBar: context.responsive(
          const UserBottomNarbar(),
          lg: const SizedBox.shrink(),
        ),
      ),
    ),
    lg: SafeArea(
      left: true,
      right: true,
      child: Scaffold(
        drawer: SizedBox.shrink(),
        appBar: userAppBar(onTap: () {
          _key.currentState?.update();
        }),
        body: Builder(
          builder: (ctx) {
            return Row(
              children: [
                AAAA(
                  key: _key,
                ),
                Expanded(
                  child: SelectionArea(child: child),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: context.responsive(
          const UserBottomNarbar(),
          lg: const SizedBox.shrink(),
        ),
      ),
    ),
  );
};

class AAAA extends StatefulWidget {
  double width = 0;

  AAAA({super.key});

  @override
  State<AAAA> createState() => _AAAAState();
}

class _AAAAState extends State<AAAA> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: widget.width,
      color: Colors.red,
    );
  }

  void update() {
    setState(() {
      widget.width = widget.width == 0 ? 280 : 0;
    });
  }
}
