import 'package:ecorporativo/src/features/home/domain/entities/helpdesk_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'helpdesk_dates_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class HelpDeskDatesModel {
  @JsonKey(name: "data_abertura")
  final DateTime? openingDate;
  @JsonKey(name: "data_atendimento")
  final DateTime? serviceDate;
  @JsonKey(name: "data_conclusao")
  final DateTime? finishDate;

  HelpDeskDatesModel({this.finishDate, this.openingDate, this.serviceDate});
  factory HelpDeskDatesModel.fromJson(dynamic json) =>
      _$HelpDeskDatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelpDeskDatesModelToJson(this);

  static HelpDeskDatesEntity toEntity(HelpDeskDatesModel model) {
    return HelpDeskDatesEntity(
        finishDate: model.finishDate,
        openingDate: model.openingDate,
        serviceDate: model.serviceDate);
  }

  static HelpDeskDatesModel toModel(HelpDeskDatesEntity entity) {
    return HelpDeskDatesModel(
        finishDate: entity.finishDate,
        openingDate: entity.openingDate,
        serviceDate: entity.serviceDate);
  }
}
