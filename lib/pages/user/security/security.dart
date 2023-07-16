library security;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/models/user/user.model.dart';
import 'package:otc/models/user_base/user_base.model.dart';
import 'package:otc/pages/user/captcha/captcha.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/providers/user.provider.dart';
import 'package:otc/router/router.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/navigator.dart';
import 'package:otc/utils/string.dart';
import 'package:otc/widgets/ui_button.dart';

part 'security.managment.dart';
part 'security.item.dart';
part 'security.authrization.dart';

class UserSecurity extends ConsumerWidget {
  const UserSecurity({super.key});

  @override
  Widget build(context, ref) {
    final user = ref.watch(userBaseProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const UserTopBlock(),
          SecurityAuthrization(user: user),
          SecurityManagment(user: user),
        ],
      ),
    );
  }
}

class _Item {
  final int typeId;
  final String name;
  final String? value;
  final String description;
  final Widget action;

  _Item({
    required this.typeId,
    required this.name,
    required this.value,
    required this.description,
    required this.action,
  });
}
