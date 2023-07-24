import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/pages/user/c2c/c2c_agent_data.dart';
import 'package:otc/pages/user/c2c/c2c_agent_profile.dart';
import 'package:otc/pages/user/c2c/c2c_chart.dart';
import 'package:otc/pages/user/c2c/c2c_user_profile.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/pages/user/home/verify_block.dart';
import 'package:otc/providers/user.provider.dart';

class UserC2C extends ConsumerWidget {
  const UserC2C({super.key});

  @override
  Widget build(context, ref) {
    final kycAuthed = ref.read(kycAuthProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const UserTopBlock(),
          if (!kycAuthed) const VerifyBlock(),
          const C2cUserProfile(),
          const C2cAgentProfile(),
          const C2cChart(),
        ],
      ),
    );
  }
}
