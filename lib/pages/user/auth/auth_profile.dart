import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/components/cell/cell.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/providers/user.provider.dart';

class AuthProfile extends ConsumerWidget {
  const AuthProfile({super.key});

  @override
  build(context, ref) {
    final user = ref.watch(userProvider);
    return SizedBox(
      width: 280,
      height: 228,
      child: Panel(
        title: "个人信息",
        child: Column(
          children: [
            SizedBox(height: 24),
            Cell(
              titleText: "姓名",
              trailingText: "姓名",
            ),
            Cell(
              titleText: "年龄",
              trailingText: "姓名",
            ),
            Cell(
              titleText: "身份证",
              trailingText: "姓名",
            ),
          ],
        ),
      ),
    );
  }
}
