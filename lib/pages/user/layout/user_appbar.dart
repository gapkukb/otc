import 'package:flutter/material.dart';
import 'package:otc/utils/responsive.dart';

AppBar userAppBar({VoidCallback? onTap}) {
  return AppBar(
    // title: const Text("ttitle"),
    leading: Builder(
      builder: (context) {
        return IconButton(
          onPressed: onTap ??
              () {
                Scaffold.of(context).openDrawer();
              },
          icon: const Icon(Icons.menu),
        );
      },
    ),
    title: Image.asset("assets/images/logo.png"),
    actions: [
      FilledButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text("注册"),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Show Snackbar',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Show Snackbar',
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Show Snackbar',
        onPressed: () {},
      ),
    ],
  );
}
