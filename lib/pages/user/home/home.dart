import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/pages/user/home/fee.dart';
import 'package:otc/pages/user/home/log.dart';
import 'package:otc/pages/user/home/overview.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/pages/user/home/verify_block.dart';
import 'package:otc/providers/user.provider.dart';

class UserHome extends ConsumerWidget {
  const UserHome({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final kyc = ref.read(kycProvider);
    return Material(
      color: Colors.grey.shade50,
      child: ListView(
        children: [
          const UserTopBlock(),
          if (kyc == null) const VerifyBlock(),
          const Overview(),
          const Fee(),
          const Log(),
        ],
      ),
    );
  }
}
