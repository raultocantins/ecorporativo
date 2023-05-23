import 'package:ecorporativo/src/features/home/data/models/item_contract_model.dart';
import 'package:ecorporativo/src/features/home/domain/entities/contract_items_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'contract_items_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ContractItemsModel {
  @JsonKey(name: "itens")
  final List<ItemContractModel> items;

  ContractItemsModel({required this.items});
  factory ContractItemsModel.fromJson(dynamic json) =>
      _$ContractItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractItemsModelToJson(this);

  static ContractItemsEntity toEntity(ContractItemsModel model) {
    return ContractItemsEntity(
      items: model.items.map((e) => ItemContractModel.toEntity(e)).toList(),
    );
  }

  static ContractItemsModel toModel(ContractItemsEntity entity) {
    return ContractItemsModel(
      items: entity.items.map((e) => ItemContractModel.toModel(e)).toList(),
    );
  }
}
