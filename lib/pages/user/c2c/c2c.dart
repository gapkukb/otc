import 'package:flutter/material.dart';
import 'package:otc/pages/user/c2c/c2c_agent_data.dart';
import 'package:otc/pages/user/c2c/c2c_agent_profile.dart';
import 'package:otc/pages/user/c2c/c2c_chart.dart';
import 'package:otc/pages/user/c2c/c2c_user_profile.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/pages/user/home/verify_block.dart';

class UserC2C extends StatefulWidget {
  const UserC2C({super.key});

  @override
  State<UserC2C> createState() => _UserC2CState();
}

class _UserC2CState extends State<UserC2C> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserTopBlock(),
          VerifyBlock(),
          C2cUserProfile(),
          C2cAgentProfile(),
          C2cAgentData(),
          C2cChart(),
        ],
      ),
    );
  }
}
