import 'package:dio/dio.dart';

sealed class ApiResult<T> {
  const ApiResult._();
  const factory ApiResult.success({T data}) = Success<T>;

  const factory ApiResult.failure(
      {required String message, required String error}) = Failure<T>;
}

class Success<T> extends ApiResult<T> {
  final Map<String, String>? headers;
  final T? data;
  const Success({this.data, this.headers}) : super._();
}

class Failure<T> extends ApiResult<T> {
  final String message;
  final String error;
  final int? statusCode;
  final Map<String, dynamic>? data;
  final Map<String, String>? headers;
  const Failure({
    required this.message,
    required this.error,
    this.data,
    this.headers,
    this.statusCode,
  }) : super._();
}

isSuccess(Response response) {
  if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
    return true;
  }
  return false;
}


