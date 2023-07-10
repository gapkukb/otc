library layout;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part './side_bar.dart';
part './side_bar_item.dart';

class Layout extends StatelessWidget {
  final SideBar? sideBar;
  final Widget child;

  const Layout({
    super.key,
    required this.child,
    this.sideBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        width: 1200,
        child: sideBar == null
            ? child
            : Row(
                children: [
                  sideBar!,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: child,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
