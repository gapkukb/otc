import 'package:flutter/material.dart';
import 'package:otc/components/panel/panel.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_blockchain.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_platform.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_trade.dart';

class WalletHistory extends StatefulWidget {
  final int? initialIndex;
  const WalletHistory({
    super.key,
    this.initialIndex,
  });

  @override
  State<WalletHistory> createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.initialIndex ?? 0,
      child: const Panel(
        titleWidget: TabBar(
          isScrollable: true,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.all(16.0),
          physics: NeverScrollableScrollPhysics(),
          tabs: [
            Text("区块链转账"),
            Text("平台转账"),
            Text("划转记录"),
          ],
        ),
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: TabBarView(
              clipBehavior: Clip.none,
              children: [
                WalletHistoryBlockchain(),
                WalletHistoryPlatform(),
                WalletHistoryTrade(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
