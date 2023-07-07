import 'package:flutter/material.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address_dc.dart';
import 'package:otc/pages/wallet/wallet_address/wallet_address_legal_tender.dart';

class WalletAddress extends StatelessWidget {
  const WalletAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      initialIndex: 1,
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
              padding: EdgeInsets.only(left: 16.0),
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
                  WalletAddressLegalTender(),
                  WalletAddressMng(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
