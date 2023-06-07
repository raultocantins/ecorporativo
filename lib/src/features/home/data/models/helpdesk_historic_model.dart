import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'helpdesk_historic_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class HelpDeskHistoricModel {
  @JsonKey(name: "codigo_hist")
  final int? id;
  @JsonKey(name: "data_hist")
  final DateTime? historicDate;

  @JsonKey(name: "hora_hist")
  final String? historicHours;

  @JsonKey(name: "quem_lancou")
  final String? historicAttendant;

  @JsonKey(name: "descricao")
  final String? historicDescription;

  HelpDeskHistoricModel(
      {this.id,
      this.historicAttendant,
      this.historicDate,
      this.historicDescription,
      this.historicHours});
  factory HelpDeskHistoricModel.fromJson(dynamic json) =>
      _$HelpDeskHistoricModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelpDeskHistoricModelToJson(this);

  static HelpDeskHistoricEntity toEntity(HelpDeskHistoricModel model) {
    return HelpDeskHistoricEntity(
        id: model.id,
        historicAttendant: model.historicAttendant,
        historicDate: model.historicDate,
        historicDescription: model.historicDescription,
        historicHours: model.historicHours);
  }

  static HelpDeskHistoricModel toModel(HelpDeskHistoricEntity entity) {
    return HelpDeskHistoricModel(
        id: entity.id,
        historicAttendant: entity.historicAttendant,
        historicDate: entity.historicDate,
        historicDescription: entity.historicDescription,
        historicHours: entity.historicHours);
  }
}
