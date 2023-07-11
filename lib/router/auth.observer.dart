import 'package:flutter/material.dart';
import 'package:otc/global/global.dart';
import 'package:otc/router/router.dart';

class AuthObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (global.authorization == null) {
      router.replace('/login');
    } else {
      super.didPush(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (global.authorization == null) {
      router.replace('/login');
    } else {
      super.didPop(route, previousRoute);
    }
  }
}
