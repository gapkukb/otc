import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otc/apis/apis.dart';
import 'package:otc/models/pagination/pagination.model.dart';
import 'package:otc/models/wallet.blockchain.history/wallet.blockchain.history.model.dart';
import 'package:otc/models/wallet.transfer.history/wallet.transfer.history.model.dart';

final blockchainHisotryProvider = FutureProvider.autoDispose.family<PaginationModel<WalletBlockchainHistoryModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.wallet.blockchainHistory(filters);
});

final platformHisotryProvider = FutureProvider.autoDispose.family<PaginationModel<WalletTransferHistoryModel>, Map<String, dynamic>>((ref, filters) async {
  return await apis.wallet.transferRecords(filters);
});
