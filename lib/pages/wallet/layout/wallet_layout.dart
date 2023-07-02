import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

ShellRouteBuilder walletLayout = (context, state, child) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: child,
      ),
    ),
  );
};
