// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InvoicesController on _InvoicesControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_InvoicesControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$contractIdAtom =
      Atom(name: '_InvoicesControllerBase.contractId', context: context);

  @override
  int? get contractId {
    _$contractIdAtom.reportRead();
    return super.contractId;
  }

  @override
  set contractId(int? value) {
    _$contractIdAtom.reportWrite(value, super.contractId, () {
      super.contractId = value;
    });
  }

  late final _$invoicesAtom =
      Atom(name: '_InvoicesControllerBase.invoices', context: context);

  @override
  InvoicesEntity? get invoices {
    _$invoicesAtom.reportRead();
    return super.invoices;
  }

  @override
  set invoices(InvoicesEntity? value) {
    _$invoicesAtom.reportWrite(value, super.invoices, () {
      super.invoices = value;
    });
  }

  late final _$moreInvoicesAtom =
      Atom(name: '_InvoicesControllerBase.moreInvoices', context: context);

  @override
  InvoicesEntity? get moreInvoices {
    _$moreInvoicesAtom.reportRead();
    return super.moreInvoices;
  }

  @override
  set moreInvoices(InvoicesEntity? value) {
    _$moreInvoicesAtom.reportWrite(value, super.moreInvoices, () {
      super.moreInvoices = value;
    });
  }

  late final _$_InvoicesControllerBaseActionController =
      ActionController(name: '_InvoicesControllerBase', context: context);

  @override
  dynamic changeIsLoading(bool value) {
    final _$actionInfo = _$_InvoicesControllerBaseActionController.startAction(
        name: '_InvoicesControllerBase.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_InvoicesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeInvoices(InvoicesEntity value) {
    final _$actionInfo = _$_InvoicesControllerBaseActionController.startAction(
        name: '_InvoicesControllerBase.changeInvoices');
    try {
      return super.changeInvoices(value);
    } finally {
      _$_InvoicesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMoreInvoices(InvoicesEntity value) {
    final _$actionInfo = _$_InvoicesControllerBaseActionController.startAction(
        name: '_InvoicesControllerBase.changeMoreInvoices');
    try {
      return super.changeMoreInvoices(value);
    } finally {
      _$_InvoicesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeContractId(int value) {
    final _$actionInfo = _$_InvoicesControllerBaseActionController.startAction(
        name: '_InvoicesControllerBase.changeContractId');
    try {
      return super.changeContractId(value);
    } finally {
      _$_InvoicesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_InvoicesControllerBaseActionController.startAction(
        name: '_InvoicesControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_InvoicesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
contractId: ${contractId},
invoices: ${invoices},
moreInvoices: ${moreInvoices}
    ''';
  }
}
