import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/global/global.dart';
import 'package:otc/router/router.dart';

class CaptchaValidation extends ConsumerWidget {
  final Widget child;
  const CaptchaValidation({
    super.key,
    required this.child,
  });

  @override
  Widget build(context, ref) {
    if (global.captchaTokenExpire.isBefore(DateTime.now())) {
      return InkWell(
        onTap: () async {
          final result = await context.push(Routes.captcha);
        },
        child: AbsorbPointer(
          child: child,
        ),
      );
    }
    return child;
  }
}
