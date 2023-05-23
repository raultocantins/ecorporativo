// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractItemsModel _$ContractItemsModelFromJson(Map json) => ContractItemsModel(
      items: (json['itens'] as List<dynamic>)
          .map((e) => ItemContractModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ContractItemsModelToJson(ContractItemsModel instance) =>
    <String, dynamic>{
      'itens': instance.items.map((e) => e.toJson()).toList(),
    };
