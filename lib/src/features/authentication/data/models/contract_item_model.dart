import 'package:ecorporativo/src/features/authentication/domain/entities/contract_item_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'contract_item_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class ContractItemModel {
  @JsonKey(name: "codigo_contrato")
  final int id;
  @JsonKey(name: "codigo_cliente")
  final int? codigoCliente;
  @JsonKey(name: "codigo_empresa")
  final int? codigoEmpresa;
  final int? duracao;
  final bool? fidelizacao;
  @JsonKey(name: "numero_contrato")
  final String? numeroContrato;
  final String? status;
  @JsonKey(name: "codigo_status")
  final String? codigoStatus;
  @JsonKey(name: "data_inicio")
  final DateTime? dataInicio;
  @JsonKey(name: "data_termino")
  final DateTime? dataTermino;
  @JsonKey(name: "dia_vencimento")
  final int? diaVencimento;
  @JsonKey(name: "data_ativacao")
  final DateTime? dataAtivacao;
  @JsonKey(name: "data_cancelamento")
  final DateTime? dataCancelamento;
  @JsonKey(name: "data_bloqueio")
  final DateTime? dataBloqueio;
  @JsonKey(name: "data_suspensao")
  final DateTime? dataSuspensao;
  @JsonKey(name: "data_transferencia")
  final DateTime? dataTransferencia;
  @JsonKey(name: "data_conclusao")
  final DateTime? dataConclusao;
  @JsonKey(name: "contrato_assinado")
  final bool? isSigned;

  ContractItemModel(
      {required this.id,
      this.duracao,
      this.fidelizacao,
      this.status,
      this.codigoCliente,
      this.codigoEmpresa,
      this.codigoStatus,
      this.dataAtivacao,
      this.dataBloqueio,
      this.dataCancelamento,
      this.dataConclusao,
      this.dataInicio,
      this.dataSuspensao,
      this.dataTermino,
      this.dataTransferencia,
      this.diaVencimento,
      this.numeroContrato,
      this.isSigned});
  factory ContractItemModel.fromJson(dynamic json) =>
      _$ContractItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractItemModelToJson(this);

  static ContractItemEntity toEntity(ContractItemModel model) {
    return ContractItemEntity(
        id: model.id,
        codigoCliente: model.codigoCliente,
        codigoEmpresa: model.codigoEmpresa,
        codigoStatus: model.codigoStatus,
        dataAtivacao: model.dataAtivacao,
        dataBloqueio: model.dataBloqueio,
        dataCancelamento: model.dataCancelamento,
        dataConclusao: model.dataConclusao,
        dataInicio: model.dataInicio,
        dataSuspensao: model.dataSuspensao,
        dataTermino: model.dataTermino,
        dataTransferencia: model.dataTransferencia,
        diaVencimento: model.diaVencimento,
        duracao: model.duracao,
        fidelizacao: model.fidelizacao,
        numeroContrato: model.numeroContrato,
        status: model.status,
        isSigned: model.isSigned);
  }

  static ContractItemModel toModel(ContractItemEntity entity) {
    return ContractItemModel(
        id: entity.id,
        codigoCliente: entity.codigoCliente,
        codigoEmpresa: entity.codigoEmpresa,
        codigoStatus: entity.codigoStatus,
        dataAtivacao: entity.dataAtivacao,
        dataBloqueio: entity.dataBloqueio,
        dataCancelamento: entity.dataCancelamento,
        dataConclusao: entity.dataConclusao,
        dataInicio: entity.dataInicio,
        dataSuspensao: entity.dataSuspensao,
        dataTermino: entity.dataTermino,
        dataTransferencia: entity.dataTransferencia,
        diaVencimento: entity.diaVencimento,
        duracao: entity.duracao,
        fidelizacao: entity.fidelizacao,
        numeroContrato: entity.numeroContrato,
        status: entity.status,
        isSigned: entity.isSigned);
  }
}
