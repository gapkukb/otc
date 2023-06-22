import 'package:flutter/material.dart';
import 'package:otc/pages/components/gridview/gridview.dart';
import 'package:otc/pages/components/gridview/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:otc/pages/components/panel/panel.dart';
import 'package:otc/pages/user/c2c/c2c_agent_data.dart';
import 'package:otc/pages/user/c2c/c2c_agent_profile.dart';
import 'package:otc/pages/user/c2c/c2c_chart.dart';
import 'package:otc/pages/user/c2c/c2c_user_profile.dart';
import 'package:otc/utils/responsive.dart';

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
          C2cUserProfile(),
          C2cAgentProfile(),
          C2cAgentData(),
          C2cChart(),
        ],
      ),
    );
  }
}
