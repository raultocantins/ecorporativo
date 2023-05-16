// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractItemModel _$ContractItemModelFromJson(Map json) => ContractItemModel(
      id: json['codigo_contrato'] as int,
      duracao: json['duracao'] as int?,
      fidelizacao: json['fidelizacao'] as bool?,
      status: json['status'] as String?,
      codigoCliente: json['codigo_cliente'] as int?,
      codigoEmpresa: json['codigo_empresa'] as int?,
      codigoStatus: json['codigo_status'] as String?,
      dataAtivacao: json['data_ativacao'] == null
          ? null
          : DateTime.parse(json['data_ativacao'] as String),
      dataBloqueio: json['data_bloqueio'] == null
          ? null
          : DateTime.parse(json['data_bloqueio'] as String),
      dataCancelamento: json['data_cancelamento'] == null
          ? null
          : DateTime.parse(json['data_cancelamento'] as String),
      dataConclusao: json['data_conclusao'] == null
          ? null
          : DateTime.parse(json['data_conclusao'] as String),
      dataInicio: json['data_inicio'] == null
          ? null
          : DateTime.parse(json['data_inicio'] as String),
      dataSuspensao: json['data_suspensao'] == null
          ? null
          : DateTime.parse(json['data_suspensao'] as String),
      dataTermino: json['data_termino'] == null
          ? null
          : DateTime.parse(json['data_termino'] as String),
      dataTransferencia: json['data_transferencia'] == null
          ? null
          : DateTime.parse(json['data_transferencia'] as String),
      diaVencimento: json['dia_vencimento'] as int?,
      numeroContrato: json['numero_contrato'] as String?,
      isSigned: json['contrato_assinado'] as bool?,
    );

Map<String, dynamic> _$ContractItemModelToJson(ContractItemModel instance) =>
    <String, dynamic>{
      'codigo_contrato': instance.id,
      'codigo_cliente': instance.codigoCliente,
      'codigo_empresa': instance.codigoEmpresa,
      'duracao': instance.duracao,
      'fidelizacao': instance.fidelizacao,
      'numero_contrato': instance.numeroContrato,
      'status': instance.status,
      'codigo_status': instance.codigoStatus,
      'data_inicio': instance.dataInicio?.toIso8601String(),
      'data_termino': instance.dataTermino?.toIso8601String(),
      'dia_vencimento': instance.diaVencimento,
      'data_ativacao': instance.dataAtivacao?.toIso8601String(),
      'data_cancelamento': instance.dataCancelamento?.toIso8601String(),
      'data_bloqueio': instance.dataBloqueio?.toIso8601String(),
      'data_suspensao': instance.dataSuspensao?.toIso8601String(),
      'data_transferencia': instance.dataTransferencia?.toIso8601String(),
      'data_conclusao': instance.dataConclusao?.toIso8601String(),
      'contrato_assinado': instance.isSigned,
    };
