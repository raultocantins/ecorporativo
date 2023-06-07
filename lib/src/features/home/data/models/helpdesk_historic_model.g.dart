// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk_historic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpDeskHistoricModel _$HelpDeskHistoricModelFromJson(Map json) =>
    HelpDeskHistoricModel(
      id: json['codigo_hist'] as int?,
      historicAttendant: json['quem_lancou'] as String?,
      historicDate: json['data_hist'] == null
          ? null
          : DateTime.parse(json['data_hist'] as String),
      historicDescription: json['descricao'] as String?,
      historicHours: json['hora_hist'] as String?,
    );

Map<String, dynamic> _$HelpDeskHistoricModelToJson(
        HelpDeskHistoricModel instance) =>
    <String, dynamic>{
      'codigo_hist': instance.id,
      'data_hist': instance.historicDate?.toIso8601String(),
      'hora_hist': instance.historicHours,
      'quem_lancou': instance.historicAttendant,
      'descricao': instance.historicDescription,
    };
