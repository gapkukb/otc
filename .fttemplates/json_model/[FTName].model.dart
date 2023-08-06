import 'package:json_annotation/json_annotation.dart';
part '[FTName].model.g.dart';

@JsonSerializable()
class [FTName | pascalcase]Model {
  final String firstName, lastName;

  [FTName | pascalcase]Model({
    required this.firstName, 
    required this.lastName,
  });
  
  factory [FTName | pascalcase]Model.fromJson(Map<String, dynamic> json) => _$[FTName | pascalcase]ModelFromJson(json);

  Map<String, dynamic> toJson() => _$[FTName | pascalcase]ModelToJson(this);
}

