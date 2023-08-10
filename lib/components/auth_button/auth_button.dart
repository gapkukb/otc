import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';

class AuthButton extends ConsumerWidget {
  final Widget child;
  const AuthButton({
    super.key,
    required this.child,
  });

  @override
  Widget build(context, ref) {
    final authed = ref.watch(authProvider);

    if (authed) return child;
    return InkWell(
      onTap: () {
        context.push(Routes.login);
      },
      child: AbsorbPointer(
        child: child,
      ),
    );
  }
}
