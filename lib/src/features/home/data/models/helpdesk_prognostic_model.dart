import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'helpdesk_prognostic_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class HelpDeskPrognosticModel {
  @JsonKey(name: "descricao_sintoma")
  final String? description;
  @JsonKey(name: "codigo_sintoma")
  final int? code;

  HelpDeskPrognosticModel({this.code, this.description});
  factory HelpDeskPrognosticModel.fromJson(dynamic json) =>
      _$HelpDeskPrognosticModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelpDeskPrognosticModelToJson(this);

  static HelpDeskPrognosticEntity toEntity(HelpDeskPrognosticModel model) {
    return HelpDeskPrognosticEntity(
        code: model.code, description: model.description);
  }

  static HelpDeskPrognosticModel toModel(HelpDeskPrognosticEntity entity) {
    return HelpDeskPrognosticModel(
        code: entity.code, description: entity.description);
  }
}
