import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otc/pages/user/rebate/rebate_anget_details.dart';
import 'package:otc/pages/user/rebate/rebate_details.dart';
import 'package:otc/pages/user/rebate/rebate_proportion.dart';
import 'package:otc/pages/user/rebate/rebate_statics.dart';
import './rebate_banner.dart';

class UserRebate extends StatefulWidget {
  const UserRebate({super.key});

  @override
  State<UserRebate> createState() => _UserRebateState();
}

class _UserRebateState extends State<UserRebate> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          RebateBanner(),
          RebateProportion(),
          RebateStatics(),
          RebateDetails(),
          RebateAgentDetails(),
        ],
      ),
    );
  }
}
