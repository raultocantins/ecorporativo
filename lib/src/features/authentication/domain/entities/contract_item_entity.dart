class ContractItemEntity {
  final int id;
  final int? codigoCliente;
  final int? codigoEmpresa;
  final int? duracao;
  final bool? fidelizacao;
  final String? numeroContrato;
  final String? status;
  final String? codigoStatus;
  final DateTime? dataInicio;
  final DateTime? dataTermino;
  final int? diaVencimento;
  final DateTime? dataAtivacao;
  final DateTime? dataCancelamento;
  final DateTime? dataBloqueio;
  final DateTime? dataSuspensao;
  final DateTime? dataTransferencia;
  final DateTime? dataConclusao;
  bool? isSigned;

  ContractItemEntity(
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
}
