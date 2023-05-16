// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicesModel _$InvoicesModelFromJson(Map json) => InvoicesModel(
      invoices: (json['financeiros'] as List<dynamic>)
          .map((e) => InvoiceModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$InvoicesModelToJson(InvoicesModel instance) =>
    <String, dynamic>{
      'financeiros': instance.invoices.map((e) => e.toJson()).toList(),
    };
