class BaseException implements Exception {
  final String code;
  final String? message;

  BaseException({
    required this.code,
    this.message,
  });
}

class NetworkException extends BaseException {
  NetworkException({
    String code = "network_error",
    String? message,
  }) : super(code: code);
}

class UnknownErrorException extends BaseException {
  UnknownErrorException({
    String code = "unknown_error",
    String? message,
  }) : super(code: code);
}
