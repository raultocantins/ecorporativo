// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceModel _$InvoiceModelFromJson(Map json) => InvoiceModel(
      situacao: json['situacao'] as String,
      codigoCliente: json['codigo_cliente'] as int?,
      codigoRegistro: json['codigo_registro'] as int?,
      documento: json['documento'] as String?,
      dataVencimento: json['data_vencimento'] == null
          ? null
          : DateTime.parse(json['data_vencimento'] as String),
      valor: (json['valor'] as num?)?.toDouble(),
      dataInforme: json['data_informe'] == null
          ? null
          : DateTime.parse(json['data_informe'] as String),
      dataExpiraInforme: json['data_expira_informe'] == null
          ? null
          : DateTime.parse(json['data_expira_informe'] as String),
      dataPagamento: json['data_pagamento'] == null
          ? null
          : DateTime.parse(json['data_pagamento'] as String),
      formaPagamento: json['forma_pagamento'] as String?,
      nossoNumero: json['nosso_numero'] as String?,
      linhaDigitavel: json['linha_digitavel'] as String?,
      codigoDesdobramento: json['codigo_desdobramento'] as int?,
    );

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'codigo_cliente': instance.codigoCliente,
      'codigo_registro': instance.codigoRegistro,
      'documento': instance.documento,
      'data_vencimento': instance.dataVencimento?.toIso8601String(),
      'valor': instance.valor,
      'situacao': instance.situacao,
      'data_informe': instance.dataInforme?.toIso8601String(),
      'data_expira_informe': instance.dataExpiraInforme?.toIso8601String(),
      'data_pagamento': instance.dataPagamento?.toIso8601String(),
      'forma_pagamento': instance.formaPagamento,
      'nosso_numero': instance.nossoNumero,
      'linha_digitavel': instance.linhaDigitavel,
      'codigo_desdobramento': instance.codigoDesdobramento,
    };
