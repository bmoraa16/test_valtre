class NetworkError {
  const NetworkError({required this.errorType, this.statusCode});

  final ErrorType errorType;
  final int? statusCode;
}

enum ErrorType {
  serverError,
  timeoutError,
  networkError,
  parseError,
  unauthorized,
  unknown,
}
