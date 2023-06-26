import 'package:flutter/material.dart';
import 'package:otc/pages/wallet/banks/wallet_address_dc.dart';
import 'package:otc/pages/wallet/banks/wallet_address_legal_tender.dart';

class WalletAddressDC extends StatelessWidget {
  const WalletAddressDC({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Card(
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: '法币支付管理'),
                Tab(text: '提币地址管理'),
              ],
              labelColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
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
