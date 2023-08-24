import 'package:asksql/core/env/key_api.dart';
import 'package:asksql/core/responses/get_sqlcode_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'models/body_data.dart';

abstract class IGetSqlCodeData {
  Future<Either<FailureSqlCodeResponse, SuccessSqlCodeResponse>> getSqlCode(
      String body);
}

class GetSqlCodeData implements IGetSqlCodeData {
  final Dio dio;
  GetSqlCodeData({required this.dio});
  @override
  Future<Either<FailureSqlCodeResponse, SuccessSqlCodeResponse>> getSqlCode(
      String param) async {
    try {
      BodyData body = BodyData(
        max_tokens: "512",
        mode: "python",
        model: "icortex-1",
        n: "1",
        temperature: "0",
        text: param,
      );
      final result = await dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "Bearer $keyApi"
          },
        ),
        data: body.toJson(),
      );
      if (result.data['status'] != 'success') {
        return Left(FailureSqlCodeResponse());
      } else {
        return Right(SuccessSqlCodeResponse(
            text: result.data['data']['outputs'][0]['text']));
      }
    } catch (e) {
      return Left(FailureSqlCodeResponse());
    }
  }
}
