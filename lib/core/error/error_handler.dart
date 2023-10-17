import 'package:dio/dio.dart';
import 'package:olearistest/core/error/failures.dart';

Future<Failure> errorHandler(Object error, Failure? defaultFailure) async {
  try {
    if (error is DioException) {
      if (error.response != null) {
        if (error.response!.statusCode == 403 || error.response!.statusCode == 401) {
          return UnauthorizedFailure();
        } else if (error.response!.statusCode == 403 && defaultFailure is ProfileFailure) {
          return UnauthorizedFailure();
        }
        return Failure(errorMessage: error.response?.data);
      }
    }
    return defaultFailure!;
  } catch (err) {
    return Failure(errorMessage: err.toString());
  }
}
