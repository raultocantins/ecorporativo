import 'package:ecorporativo/src/features/home/data/models/invoice_model.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/invoices_entity.dart';

part 'invoices_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class InvoicesModel {
  @JsonKey(name: "financeiros")
  final List<InvoiceModel> invoices;

  InvoicesModel({required this.invoices});
  factory InvoicesModel.fromJson(dynamic json) => _$InvoicesModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicesModelToJson(this);

  static InvoicesEntity toEntity(InvoicesModel model) {
    return InvoicesEntity(
        invoices: model.invoices.map((e) => InvoiceModel.toEntity(e)).toList());
  }

  static InvoicesModel toModel(InvoicesEntity entity) {
    return InvoicesModel(
        invoices: entity.invoices.map((e) => InvoiceModel.toModel(e)).toList());
  }
}
