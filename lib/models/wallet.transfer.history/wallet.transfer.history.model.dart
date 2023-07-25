import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet.transfer.history.model.freezed.dart';
part 'wallet.transfer.history.model.g.dart';

@freezed
class WalletTransferHistoryModel with _$WalletTransferHistoryModel {
  const factory WalletTransferHistoryModel({
    required num id,
    required String reference,
    @JsonKey(name: "in") required bool incomne,
    required String fromUsername,
    required String toUsername,
    required num fromBalanceBefore,
    required num fromBalanceAfter,
    required num toBalanceBefore,
    required num toBalanceAfter,
    required String currency,
    required num amount,
    required String createdTime,
  }) = _WalletTransferHistoryModel;

  factory WalletTransferHistoryModel.fromJson(Map<String, Object?> json) => _$WalletTransferHistoryModelFromJson(json);
}
