import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet.bank.model.freezed.dart';
part 'wallet.bank.model.g.dart';

@freezed
class WalletBankModel with _$WalletBankModel {
  const factory WalletBankModel({
    /// 	唯一标识
    required String reference,

    /// 	标题
    required String title,

    /// 	银行卡号
    required String cardNumber,

    /// 	银行卡户主名
    required String account,

    /// 	银行,可用值:CMB,ICBC,BOCOM,CCB,ABC,CEB,CMBC,PAB,SPDB,CIB,BOCSH,CITIC,BOB,NJCB,GDB,HXBC,PSBC,SDB,BEA,BOS,HSB,ZSB,BJAB,HZBC,NBBC,HBNNX,HKBC,NEBC,GDNX,GXNX,GZNX,HANNX,HENNX,HLJNX,EBCL,HBNX,HNNX,ZJNX,CQSB,QLSB,QHNX,SDNX,YKSB,YNNX,CSBC,SXNX,SHXNX,SRCB,JSBC,JXNX,JJBC,NYSBC,NMNX,LNNX,SCNX,BRCB,FJNX,GSNX,BSBC
    required String bank,

    /// 	支行地址
    required String bankBranch,

    /// 	是否默认使用
    required bool defaultUsed,

    /// 	户主名
    required String name,
    required bool? disabled,
    required bool? used,
  }) = _WalletBankModel;

  factory WalletBankModel.fromJson(Map<String, Object?> json) => _$WalletBankModelFromJson(json);
}
