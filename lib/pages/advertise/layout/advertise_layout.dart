import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/utils/responsive.dart';

ShellRouteBuilder advertiseLayout = (context, state, child) {
  return Scaffold(
    body: SafeArea(
      child: child,
    ),
  );
};
