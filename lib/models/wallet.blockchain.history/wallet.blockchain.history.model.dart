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
    required String address,
    required num transactionId,
    required String transactionHash,
    required String confirmed,
  }) = _WalletBlockchainHistoryModel;

  factory WalletBlockchainHistoryModel.fromJson(Map<String, Object?> json) => _$WalletBlockchainHistoryModelFromJson(json);
}
