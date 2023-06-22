import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/router/router.dart';

final appBar = AppBar(
  // title: const Text("ttitle"),
  leading: Image.asset("assets/images/logo.png"),
  actions: [
    Builder(builder: (context) {
      return FilledButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text("注册"),
        onPressed: () {
          context.go('/rebate');
        },
      );
    }),
    IconButton(
      icon: const Icon(Icons.menu),
      tooltip: 'Show Snackbar',
      onPressed: () {},
    )
  ],
);
