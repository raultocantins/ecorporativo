// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk_dates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpDeskDatesModel _$HelpDeskDatesModelFromJson(Map json) => HelpDeskDatesModel(
      finishDate: json['data_conclusao'] == null
          ? null
          : DateTime.parse(json['data_conclusao'] as String),
      openingDate: json['data_abertura'] == null
          ? null
          : DateTime.parse(json['data_abertura'] as String),
      serviceDate: json['data_atendimento'] == null
          ? null
          : DateTime.parse(json['data_atendimento'] as String),
    );

Map<String, dynamic> _$HelpDeskDatesModelToJson(HelpDeskDatesModel instance) =>
    <String, dynamic>{
      'data_abertura': instance.openingDate?.toIso8601String(),
      'data_atendimento': instance.serviceDate?.toIso8601String(),
      'data_conclusao': instance.finishDate?.toIso8601String(),
    };
