import 'package:asksql/features/home/data/get_sqlcode_data.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late GetSqlCodeData data;
  late Dio mockDio;
  setUp(() {
    mockDio = MockDio();
    data = GetSqlCodeData(dio: mockDio);
  });

  group('GetSqlCodeData', () {
    test('getSqlCode - Success', () async {
      when(() => mockDio.post(any(),
              options: any(named: 'options'), data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(),
                data: {
                  'status': 'success',
                  'data': {
                    'outputs': [
                      {'text': 'SQL Code'}
                    ]
                  }
                },
                statusCode: 200,
              ));

      final result = await data.getSqlCode('SQL Query');

      expect(result, isA<Right>());
    });

    test('getSqlCode - Failure', () async {
      when(() => mockDio.post(any(),
              options: any(named: 'options'), data: any(named: 'data')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(),
                data: {
                  'status': 'failure',
                  'data': {
                    'outputs': [
                      {'text': 'SQL Code'}
                    ]
                  }
                },
                statusCode: 500,
              ));
      var result = await data.getSqlCode('teste');

      expect(result, isA<Left>());

      when(() => mockDio.post(any(),
          options: any(named: 'options'),
          data: any(named: 'data'))).thenThrow(Exception());
      result = await data.getSqlCode('teste');

      expect(result, isA<Left>());
    });
  });
}
