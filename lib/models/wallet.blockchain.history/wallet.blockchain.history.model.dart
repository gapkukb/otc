import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet.blockchain.history.model.freezed.dart';
part 'wallet.blockchain.history.model.g.dart';

@freezed
class WalletBlockchainHistoryModel with _$WalletBlockchainHistoryModel {
  const factory WalletBlockchainHistoryModel({
    required String reference,
    required String createdTime,
    required bool deposit,
    required String currency,
    required num amount,
    required String fromAddress,
    required String toAddress,
    required num transactionIndex,
    required String transactionHash,
    required String? confirmed,
  }) = _WalletBlockchainHistoryModel;

  factory WalletBlockchainHistoryModel.fromJson(Map<String, Object?> json) => _$WalletBlockchainHistoryModelFromJson(json);
}
