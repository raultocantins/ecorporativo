import 'package:ecorporativo/src/features/authentication/domain/entities/contracts_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'contract_item_model.dart';

part 'contracts_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ContractsModel {
  @JsonKey(name: "contratos")
  final List<ContractItemModel> contracts;
  ContractsModel({required this.contracts});
  factory ContractsModel.fromJson(dynamic json) =>
      _$ContractsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractsModelToJson(this);

  static ContractsEntity toEntity(ContractsModel model) {
    return ContractsEntity(
      contracts:
          model.contracts.map((e) => ContractItemModel.toEntity(e)).toList(),
    );
  }

  static ContractsModel toModel(ContractsEntity entity) {
    return ContractsModel(
      contracts:
          entity.contracts.map((e) => ContractItemModel.toModel(e)).toList(),
    );
  }
}
