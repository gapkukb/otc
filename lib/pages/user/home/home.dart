import 'package:flutter/material.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/otc/otc.model.dart';
import 'package:otc/pages/user/home/fee.dart';
import 'package:otc/pages/user/home/log.dart';
import 'package:otc/pages/user/home/overview.dart';
import 'package:otc/pages/user/home/top_block.dart';
import 'package:otc/pages/user/home/verify_block.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});
  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  OtcModel otcModel = const OtcModel(
    enabled: false,
    kycLevel: 0,
    bankcardReceiptMin: 0,
    bankcardReceiptMax: 0,
    bankcardReceiptDaily: 0,
    wechatReceiptMin: 0,
    wechatReceiptMax: 0,
    wechatReceiptDaily: 0,
    aliReceiptMin: 0,
    aliReceiptMax: 0,
    aliReceiptDaily: 0,
    bankcardPayoutMin: 0,
    bankcardPayoutMax: 0,
    wechatPayoutMin: 0,
    wechatPayoutMax: 0,
    aliPayoutMin: 0,
    aliPayoutMax: 0,
    bankcardPayoutDaily: 0,
    wechatPayoutDaily: 0,
    aliPayoutDaily: 0,
    lowestCommission: 0,
  );

  @override
  void initState() {
    super.initState();
    apis.user.getOtcConfig().then((value) => otcModel = value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        UserTopBlock(),
        VerifyBlock(),
        Overview(),
        Fee(),
        Log(),
      ],
    );
  }
}
