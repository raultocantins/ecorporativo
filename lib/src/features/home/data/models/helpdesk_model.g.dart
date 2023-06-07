// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpDeskModel _$HelpDeskModelFromJson(Map json) => HelpDeskModel(
      status: HelpDeskStatusModel.fromJson(json['status']),
      dates: HelpDeskDatesModel.fromJson(json['datas']),
      historicList: (json['historico'] as List<dynamic>?)
          ?.map((e) => HelpDeskHistoricModel.fromJson(e))
          .toList(),
      id: json['codigo_helpdesk'] as int,
      prognostic: HelpDeskPrognosticModel.fromJson(json['sintoma']),
    );

Map<String, dynamic> _$HelpDeskModelToJson(HelpDeskModel instance) =>
    <String, dynamic>{
      'codigo_helpdesk': instance.id,
      'status': instance.status.toJson(),
      'sintoma': instance.prognostic.toJson(),
      'historico': instance.historicList?.map((e) => e.toJson()).toList(),
      'datas': instance.dates.toJson(),
    };
