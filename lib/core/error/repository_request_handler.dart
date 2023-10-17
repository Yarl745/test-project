import 'package:dartz/dartz.dart';
import 'package:olearistest/core/error/error_handler.dart';
import 'package:olearistest/core/helper/type_aliases.dart';

import 'failures.dart';

class RepositoryRequestHandler<T> {
  FutureFailable<T> call({
    Failure? defaultFailure,
    required Future<T> Function() request,
  }) async {
    try {
      return Right(await request());
    } catch (error) {
      final failure = await errorHandler(error, defaultFailure);
      return Left(failure);
    }
  }
}

class SyncRepositoryRequestHandler<T> {
  Failable<T> call({
    Failure? defaultFailure,
    required T Function() request,
  }) {
    try {
      return Right(request());
    } catch (error) {
      return Left(defaultFailure ?? Failure(errorMessage: error.toString()));
    }
  }
}
