import 'package:ecorporativo/src/features/home/domain/entities/item_contract_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'item_contract_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ItemContractModel {
  @JsonKey(name: "codigo_contrato_item")
  final int codigoContratoItem;
  final String descricao;

  ItemContractModel(
      {required this.codigoContratoItem, required this.descricao});
  factory ItemContractModel.fromJson(dynamic json) =>
      _$ItemContractModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemContractModelToJson(this);

  static ItemContractEntity toEntity(ItemContractModel model) {
    return ItemContractEntity(
        codigoContratoItem: model.codigoContratoItem,
        descricao: model.descricao);
  }

  static ItemContractModel toModel(ItemContractEntity entity) {
    return ItemContractModel(
        codigoContratoItem: entity.codigoContratoItem,
        descricao: entity.descricao);
  }
}
