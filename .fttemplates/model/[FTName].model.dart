import 'package:freezed_annotation/freezed_annotation.dart';
part '[FTName].model.freezed.dart';
part '[FTName].model.g.dart';

@freezed
class [FTName | pascalcase]Model with _$[FTName | pascalcase]Model {
  const factory [FTName | pascalcase]Model({
    required String firstName,
    
  }) = _[FTName | pascalcase]Model;

  factory [FTName | pascalcase]Model.fromJson(Map<String, Object?> json) => _$[FTName | pascalcase]ModelFromJson(json);
}
