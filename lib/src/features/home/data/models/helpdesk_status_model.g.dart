// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpDeskStatusModel _$HelpDeskStatusModelFromJson(Map json) =>
    HelpDeskStatusModel(
      code: json['codigo_status'] as String?,
      description: json['descricao_status'] as String?,
    );

Map<String, dynamic> _$HelpDeskStatusModelToJson(
        HelpDeskStatusModel instance) =>
    <String, dynamic>{
      'descricao_status': instance.description,
      'codigo_status': instance.code,
    };
