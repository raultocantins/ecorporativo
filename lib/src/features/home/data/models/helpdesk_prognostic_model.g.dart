// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpdesk_prognostic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelpDeskPrognosticModel _$HelpDeskPrognosticModelFromJson(Map json) =>
    HelpDeskPrognosticModel(
      code: json['codigo_sintoma'] as int?,
      description: json['descricao_sintoma'] as String?,
    );

Map<String, dynamic> _$HelpDeskPrognosticModelToJson(
        HelpDeskPrognosticModel instance) =>
    <String, dynamic>{
      'descricao_sintoma': instance.description,
      'codigo_sintoma': instance.code,
    };
