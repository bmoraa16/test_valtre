import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_test_project/core/error.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:multiple_result/multiple_result.dart';

enum RequestType { get, post }

class Request {
  final String url;
  final Map<String, dynamic>? queryParams;
  final Object? body;
  final RequestType method;

  Request(
      {required this.url, this.queryParams, this.body, required this.method});
}

@injectable
class NetworkManager {
  Future<Map<String, String>> headers(String url) async {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
  }

  Future<Result<T, NetworkError>> call<T>({
    required Request request,
    required String errorMsg,
    required T Function(Map<String, dynamic> response) mapper,
  }) async {
    if (await InternetConnectionChecker.createInstance().hasConnection) {
      if (kDebugMode && request.body != null) {
        log("Request body of ${request.url}");
        log(request.body.toString());
        log("===================================================");
      }
      http.Response response;

      Uri uri = Uri.parse(request.url);

      if (request.queryParams != null) {
        uri = uri.replace(
          queryParameters: request.queryParams!.map(
            (key, value) => MapEntry(
              key,
              value.toString(),
            ),
          ),
        );
      }

      switch (request.method) {
        case RequestType.get:
          if (kDebugMode) {
            log("REQUEST URL:::::::: $uri");
          }
          response = await http
              .get(
                uri,
                headers: await headers(request.url),
              )
              .timeout(
                const Duration(seconds: 60),
                onTimeout: () => onTimeoutError(),
              )
              .catchError(
                (onError) => onError,
              );
        case RequestType.post:
          response = await http
              .post(
                Uri.parse(request.url),
                headers: await headers(request.url),
                body: jsonEncode(request.body),
              )
              .timeout(
                const Duration(seconds: 60),
                onTimeout: () => onTimeoutError(),
              )
              .catchError(
                (onError) => onError,
              );
      }

      if (kDebugMode) {
        log("Response body of ${request.url}");
        log(response.body);
        log("===================================================");
      }

      try {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);

        switch (response.statusCode) {
          case 200:
          case 201:
          case 202:
            return Result.success(mapper(jsonMap));
          case 401:
            return const Result.error(
                NetworkError(errorType: ErrorType.unauthorized));
          case 408:
            return const Result.error(
                NetworkError(errorType: ErrorType.timeoutError));
          case 500:
            return const Result.error(
                NetworkError(errorType: ErrorType.serverError));
          default:
            return const Result.error(
                NetworkError(errorType: ErrorType.unknown));
        }
      } catch (e) {
        log("Error on request ${request.url} ${e.toString()}");

        return const Result.error(
            NetworkError(errorType: ErrorType.parseError));
      }
    }
    return const Result.error(NetworkError(errorType: ErrorType.networkError));
  }

  onTimeoutError() {
    return http.Response(
      "{\"message\":\"Something went wrong, please try again later\"}",
      408,
    );
  }

  onError() {
    return http.Response(
      "{\"message\":\"Something went wrong, please try again later\"}",
      500,
    );
  }
}
