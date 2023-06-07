import 'package:ecorporativo/src/features/home/data/models/helpdesk_dates_model.dart';
import 'package:ecorporativo/src/features/home/data/models/helpdesk_historic_model.dart';
import 'package:ecorporativo/src/features/home/data/models/helpdesk_prognostic_model.dart';
import 'package:ecorporativo/src/features/home/data/models/helpdesk_status_model.dart';
import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'helpdesk_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class HelpDeskModel {
  @JsonKey(name: "codigo_helpdesk")
  final int id;
  final HelpDeskStatusModel status;
  @JsonKey(name: "sintoma")
  final HelpDeskPrognosticModel prognostic;
  @JsonKey(name: "historico")
  final List<HelpDeskHistoricModel>? historicList;
  @JsonKey(name: "datas")
  final HelpDeskDatesModel dates;

  HelpDeskModel(
      {required this.status,
      required this.dates,
      this.historicList,
      required this.id,
      required this.prognostic});
  factory HelpDeskModel.fromJson(dynamic json) => _$HelpDeskModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelpDeskModelToJson(this);

  static HelpDeskEntity toEntity(HelpDeskModel model) {
    return HelpDeskEntity(
        dates: HelpDeskDatesModel.toEntity(model.dates),
        id: model.id,
        prognostic: HelpDeskPrognosticModel.toEntity(model.prognostic),
        status: HelpDeskStatusModel.toEntity(model.status),
        historicList: model.historicList
            ?.map((e) => HelpDeskHistoricModel.toEntity(e))
            .toList());
  }

  static HelpDeskModel toModel(HelpDeskEntity entity) {
    return HelpDeskModel(
        dates: HelpDeskDatesModel.toModel(entity.dates),
        id: entity.id,
        prognostic: HelpDeskPrognosticModel.toModel(entity.prognostic),
        status: HelpDeskStatusModel.toModel(entity.status),
        historicList: entity.historicList
            ?.map((e) => HelpDeskHistoricModel.toModel(e))
            .toList());
  }
}
