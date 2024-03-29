import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otc/constants/blockchain.dart';
import 'package:otc/constants/currency.dart';
part 'address.model.freezed.dart';
part 'address.model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String title,
    required String remark,
    required String reference,
    required String username,
    required String wallet,
    required Cryptocurrency currency,
    required Blockchain blockchain,
    required String createdTime,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, Object?> json) => _$AddressModelFromJson(json);
}
