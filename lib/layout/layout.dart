import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/layout/layout.header.dart';

ShellRouteBuilder layout = (context, state, child) {
  return Scaffold(
    appBar: LayoutHeader(
      appBar: AppBar(),
    ),
    body: SelectionArea(child: child),
    bottomNavigationBar: Material(
      color: Colors.grey.shade100,
      child: const SizedBox(
        height: 36,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Copyright ©2023 Maoerduo.io",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
};
