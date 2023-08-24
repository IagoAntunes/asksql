abstract class IGetSqlCodeResponse {}

class SuccessSqlCodeResponse extends IGetSqlCodeResponse {
  String text;
  SuccessSqlCodeResponse({
    required this.text,
  });
}

class FailureSqlCodeResponse extends IGetSqlCodeResponse {}
