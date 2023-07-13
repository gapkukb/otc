import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/components/tip/tip.dart';
import 'package:otc/pages/user/home/fee.dart';
import 'package:otc/pages/user/home/indicator.dart';
import 'package:otc/pages/user/home/log.dart';
import 'package:otc/pages/user/home/overview.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/pages/user/home/verify_block.dart';
import 'package:otc/widgets/ui_button.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserTopBlock(),
        VerifyBlock(),
        Overview(),
        Fee(),
        Log(),
      ],
    );
  }
}
