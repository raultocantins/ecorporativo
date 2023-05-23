// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemContractModel _$ItemContractModelFromJson(Map json) => ItemContractModel(
      codigoContratoItem: json['codigo_contrato_item'] as int,
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$ItemContractModelToJson(ItemContractModel instance) =>
    <String, dynamic>{
      'codigo_contrato_item': instance.codigoContratoItem,
      'descricao': instance.descricao,
    };
