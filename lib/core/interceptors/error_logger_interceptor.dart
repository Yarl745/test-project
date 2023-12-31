import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:olearistest/core/helper/type_aliases.dart';

class ErrorLoggerInterceptor extends Interceptor {
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    Fimber.e('---------------- Error Logger Interceptor ----------------');
    if (err.response == null) {
      Fimber.e('Error: no response in error - $err');
    } else {
      // if (err.response!.data is Json && err.response!.data.containsKey("data")) {
      //   err.response!.data = err.response!.data["data"];
      // }
      if (err.response!.statusCode == 400) {
        final data = err.response!.data;
        if (data.isNotEmpty && data is Json) {
          final keys = data.keys;
          for (final key in keys) {
            Fimber.e('$key - ${err.response!.data[key].toString()}');
          }
        } else {
          Fimber.e('Error: no body in error response - $err');
        }
      }
    }

    super.onError(err, handler);
  }
}
