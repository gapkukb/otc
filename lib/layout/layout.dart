import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/layout/layout.header.dart';

ShellRouteBuilder layout = (context, state, child) {
  return Scaffold(
    appBar: LayoutHeader(
      appBar: AppBar(),
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: child,
      ),
    ),
  );
};
