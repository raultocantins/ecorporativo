import 'package:ecorporativo/src/features/home/domain/entities/invoice_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class InvoiceModel {
  @JsonKey(name: "codigo_cliente")
  final int? codigoCliente;
  @JsonKey(name: "codigo_registro")
  final int? codigoRegistro;
  final String? documento;
  @JsonKey(name: "data_vencimento")
  final DateTime? dataVencimento;
  final double? valor;
  final String situacao;
  @JsonKey(name: "data_informe")
  final DateTime? dataInforme;
  @JsonKey(name: "data_expira_informe")
  final DateTime? dataExpiraInforme;
  @JsonKey(name: "data_pagamento")
  final DateTime? dataPagamento;
  @JsonKey(name: "forma_pagamento")
  final String? formaPagamento;
  @JsonKey(name: "nosso_numero")
  final String? nossoNumero;
  @JsonKey(name: "linha_digitavel")
  final String? linhaDigitavel;
  @JsonKey(name: "codigo_desdobramento")
  final int? codigoDesdobramento;

  InvoiceModel({
    required this.situacao,
    this.codigoCliente,
    this.codigoRegistro,
    this.documento,
    this.dataVencimento,
    this.valor,
    this.dataInforme,
    this.dataExpiraInforme,
    this.dataPagamento,
    this.formaPagamento,
    this.nossoNumero,
    this.linhaDigitavel,
    this.codigoDesdobramento,
  });
  factory InvoiceModel.fromJson(dynamic json) => _$InvoiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);

  static InvoiceEntity toEntity(InvoiceModel model) {
    return InvoiceEntity(
      codigoCliente: model.codigoCliente,
      codigoDesdobramento: model.codigoDesdobramento,
      codigoRegistro: model.codigoRegistro,
      dataExpiraInforme: model.dataExpiraInforme,
      dataInforme: model.dataInforme,
      dataPagamento: model.dataPagamento,
      dataVencimento: model.dataVencimento,
      documento: model.documento,
      formaPagamento: model.formaPagamento,
      linhaDigitavel: model.linhaDigitavel,
      nossoNumero: model.nossoNumero,
      situacao: model.situacao,
      valor: model.valor,
    );
  }

  static InvoiceModel toModel(InvoiceEntity entity) {
    return InvoiceModel(
      codigoCliente: entity.codigoCliente,
      codigoDesdobramento: entity.codigoDesdobramento,
      codigoRegistro: entity.codigoRegistro,
      dataExpiraInforme: entity.dataExpiraInforme,
      dataInforme: entity.dataInforme,
      dataPagamento: entity.dataPagamento,
      dataVencimento: entity.dataVencimento,
      documento: entity.documento,
      formaPagamento: entity.formaPagamento,
      linhaDigitavel: entity.linhaDigitavel,
      nossoNumero: entity.nossoNumero,
      situacao: entity.situacao,
      valor: entity.valor,
    );
  }
}
