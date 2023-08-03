import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/components/pagination/pagination.dart';
import 'package:otc/components/table/table.dart';
import 'package:otc/constants/currency.dart';
import 'package:otc/models/wallet.blockchain.history/wallet.blockchain.history.model.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history_filter.dart';
import 'package:otc/pages/wallet/wallet_history/wallet_history.provider.dart';
import 'package:otc/theme/text_theme.dart';
import 'package:otc/utils/date_time.dart';
import 'package:otc/utils/number.dart';
import 'package:otc/widgets/ui_clipboard.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class WalletHistoryBlockchain extends ConsumerStatefulWidget {
  const WalletHistoryBlockchain({super.key});

  @override
  ConsumerState<WalletHistoryBlockchain> createState() => _WalletHistoryBlockchainState();
}

class _WalletHistoryBlockchainState extends ConsumerState<WalletHistoryBlockchain> {
  final Map<String, dynamic> formState = {};

  @override
  Widget build(context) {
    final begin = dateFormatter.format(DateTime.now().subtract(Duration(days: formState["datetime"] ?? 7)));

    final provider = ref.watch(
      blockchainHisotryProvider({
        "deposit": formState["deposit"] ?? true,
        "currency": formState["currency"] ?? Cryptocurrency.USDT.name,
        "reference": formState["reference"],
        "confirmed": formState["confirmed"] ?? "UNKNOWN",
        "page": 1,
        "pageSize": 10,
        "begin": "$begin 00:00:00",
        "end": "${dateFormatter.format(DateTime.now())} 23:59:59",
      }),
    );
    // provider.maybeWhen(
    //     orElse: () => setState(() {
    //           print("object");
    //           loading = false;
    //         }));
    // provider.whenData((data) {
    //   print("object1111111");
    // });

    return provider.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (_, __) => Text(_.toString() + __.toString()),
      data: (data) {
        return Text(data.toString());
      },
    );
  }
}
