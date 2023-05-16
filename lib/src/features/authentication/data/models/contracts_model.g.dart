// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsModel _$ContractsModelFromJson(Map json) => ContractsModel(
      contracts: (json['contratos'] as List<dynamic>)
          .map((e) => ContractItemModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$ContractsModelToJson(ContractsModel instance) =>
    <String, dynamic>{
      'contratos': instance.contracts.map((e) => e.toJson()).toList(),
    };
