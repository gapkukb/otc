import 'package:freezed_annotation/freezed_annotation.dart';
part '[FTName | camelcase].model.freezed.dart';
part '[FTName | camelcase].model.g.dart';

@freezed
class [FTName | capitalcase]Model with _$[FTName | capitalcase]Model {
  const factory [FTName | capitalcase]Model({
    required String firstName,
    
  }) = _[FTName | capitalcase]Model;

  factory [FTName | capitalcase]Model.fromJson(Map<String, Object?> json) => _$[FTName | capitalcase]ModelFromJson(json);
}
