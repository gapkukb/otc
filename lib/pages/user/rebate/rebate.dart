import 'package:flutter/material.dart';
import 'package:otc/pages/user/rebate/rebate_details.dart';
import 'package:otc/pages/user/rebate/rebate_invitation.dart';
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
    return Card(
      color: Colors.grey.shade50,
      child: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RebateBanner(),
            RebateProportion(),
            RebateStatics(),
            RebateDetails(),
            RebateInvitation(),
          ],
        ),
      ),
    );
  }
}
