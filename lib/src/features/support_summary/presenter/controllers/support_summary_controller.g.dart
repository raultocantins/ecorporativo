// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_summary_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupportSummaryController on _SupportSummaryControllerBase, Store {
  Computed<HelpDeskEntity?>? _$calledComputed;

  @override
  HelpDeskEntity? get called =>
      (_$calledComputed ??= Computed<HelpDeskEntity?>(() => super.called,
              name: '_SupportSummaryControllerBase.called'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_SupportSummaryControllerBase.isLoading', context: context);

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

  late final _$userIdAtom =
      Atom(name: '_SupportSummaryControllerBase.userId', context: context);

  @override
  int? get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(int? value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$helpDeskListEntityAtom = Atom(
      name: '_SupportSummaryControllerBase.helpDeskListEntity',
      context: context);

  @override
  HelpDeskListEntity? get helpDeskListEntity {
    _$helpDeskListEntityAtom.reportRead();
    return super.helpDeskListEntity;
  }

  @override
  set helpDeskListEntity(HelpDeskListEntity? value) {
    _$helpDeskListEntityAtom.reportWrite(value, super.helpDeskListEntity, () {
      super.helpDeskListEntity = value;
    });
  }

  late final _$_SupportSummaryControllerBaseActionController =
      ActionController(name: '_SupportSummaryControllerBase', context: context);

  @override
  dynamic changeIsLoading(bool value) {
    final _$actionInfo = _$_SupportSummaryControllerBaseActionController
        .startAction(name: '_SupportSummaryControllerBase.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_SupportSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeHelpDesk(HelpDeskListEntity value) {
    final _$actionInfo = _$_SupportSummaryControllerBaseActionController
        .startAction(name: '_SupportSummaryControllerBase.changeHelpDesk');
    try {
      return super.changeHelpDesk(value);
    } finally {
      _$_SupportSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUserId(int value) {
    final _$actionInfo = _$_SupportSummaryControllerBaseActionController
        .startAction(name: '_SupportSummaryControllerBase.changeUserId');
    try {
      return super.changeUserId(value);
    } finally {
      _$_SupportSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_SupportSummaryControllerBaseActionController
        .startAction(name: '_SupportSummaryControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_SupportSummaryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userId: ${userId},
helpDeskListEntity: ${helpDeskListEntity},
called: ${called}
    ''';
  }
}
