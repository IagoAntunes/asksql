import 'package:asksql/core/responses/get_sqlcode_response.dart';
import 'package:asksql/core/states/get_sqlcode_state.dart';
import 'package:asksql/features/home/data/get_sqlcode_data.dart';
import 'package:asksql/features/home/presenter/controllers/home_controller.store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSqlCodeData extends Mock implements GetSqlCodeData {}

void main() {
  late HomeController controller;
  late IGetSqlCodeData mockData;
  setUp(() {
    mockData = MockGetSqlCodeData();
    controller = HomeController(data: mockData);
  });

  tearDown(() {
    controller.responseController.text = "";
  });

  group('HomeController | ', () {
    test('Test init variables', () {
      expect(controller.data, isA<GetSqlCodeData>());
      expect(controller.state, isA<IdleGetSqlCodeState>());
      expect(controller.tableController, isA<TextEditingController>());
      expect(controller.questionController, isA<TextEditingController>());
      expect(controller.responseController, isA<TextEditingController>());
    });
    test('getSqlCode - Failure', () async {
      when(() => mockData.getSqlCode(any())).thenAnswer(
        (_) async => Left(FailureSqlCodeResponse()),
      );

      await controller.getSqlCode('balblalbalbal');

      expect(controller.responseController.text,
          "Ocorreu um problema! Tente Novamente.");
    });
    test('getSqlCode - Success', () async {
      when(() => mockData.getSqlCode(any())).thenAnswer(
        (_) async => Right(SuccessSqlCodeResponse(text: 'CREATE TABLE...')),
      );
      await controller.getSqlCode("Crie uma tabela de usuario com id e nome");

      expect(controller.responseController.text, isNotEmpty);
    });
  });
}
