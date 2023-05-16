import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'helpdesk_status_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class HelpDeskStatusModel {
  @JsonKey(name: "descricao_status")
  final String? description;
  @JsonKey(name: "codigo_status")
  final String? code;
  HelpDeskStatusModel({this.code, this.description});
  factory HelpDeskStatusModel.fromJson(dynamic json) =>
      _$HelpDeskStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelpDeskStatusModelToJson(this);

  static HelpDeskStatusEntity toEntity(HelpDeskStatusModel model) {
    return HelpDeskStatusEntity(
        code: model.code, description: model.description);
  }

  static HelpDeskStatusModel toModel(HelpDeskStatusEntity entity) {
    return HelpDeskStatusModel(
        code: entity.code, description: entity.description);
  }
}
