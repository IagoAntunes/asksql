// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$stateAtom =
      Atom(name: '_HomeController.state', context: context);

  @override
  IGetSqlCodeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(IGetSqlCodeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$tableControllerAtom =
      Atom(name: '_HomeController.tableController', context: context);

  @override
  TextEditingController get tableController {
    _$tableControllerAtom.reportRead();
    return super.tableController;
  }

  @override
  set tableController(TextEditingController value) {
    _$tableControllerAtom.reportWrite(value, super.tableController, () {
      super.tableController = value;
    });
  }

  late final _$questionControllerAtom =
      Atom(name: '_HomeController.questionController', context: context);

  @override
  TextEditingController get questionController {
    _$questionControllerAtom.reportRead();
    return super.questionController;
  }

  @override
  set questionController(TextEditingController value) {
    _$questionControllerAtom.reportWrite(value, super.questionController, () {
      super.questionController = value;
    });
  }

  late final _$responseControllerAtom =
      Atom(name: '_HomeController.responseController', context: context);

  @override
  TextEditingController get responseController {
    _$responseControllerAtom.reportRead();
    return super.responseController;
  }

  @override
  set responseController(TextEditingController value) {
    _$responseControllerAtom.reportWrite(value, super.responseController, () {
      super.responseController = value;
    });
  }

  late final _$responseAtom =
      Atom(name: '_HomeController.response', context: context);

  @override
  String? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(String? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$getSqlCodeAsyncAction =
      AsyncAction('_HomeController.getSqlCode', context: context);

  @override
  Future getSqlCode(String body) {
    return _$getSqlCodeAsyncAction.run(() => super.getSqlCode(body));
  }

  @override
  String toString() {
    return '''
state: ${state},
tableController: ${tableController},
questionController: ${questionController},
responseController: ${responseController},
response: ${response}
    ''';
  }
}
