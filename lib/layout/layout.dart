import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/layout/layout.header.dart';

ShellRouteBuilder layout = (context, state, child) {
  return SelectionArea(
    child: Scaffold(
      appBar: LayoutHeader(
        appBar: AppBar(),
      ),
      body: child,
    ),
  );
};
