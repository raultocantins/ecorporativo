class InvoiceEntity {
  final int? codigoCliente;
  final int? codigoRegistro;
  final String? documento;
  final DateTime? dataVencimento;
  final double? valor;
  final String situacao;
  final DateTime? dataInforme;
  final DateTime? dataExpiraInforme;
  final DateTime? dataPagamento;
  final String? formaPagamento;
  final String? nossoNumero;
  final String? linhaDigitavel;
  final int? codigoDesdobramento;

  InvoiceEntity({
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
}
