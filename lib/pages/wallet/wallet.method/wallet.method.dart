import 'package:flutter/material.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.crypto.dart';
import 'package:otc/pages/wallet/wallet.method/wallet.method.legal.dart';

class WalletMethod extends StatelessWidget {
  const WalletMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              tabs: [
                Tab(text: '法币支付管理'),
                Tab(text: '提币地址管理'),
              ],
              labelColor: Colors.black,
              isScrollable: true,
              dividerColor: Colors.transparent,
              physics: NeverScrollableScrollPhysics(),
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              child: TabBarView(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  WalletMethodLegal(),
                  WalletMethodCrypto(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
