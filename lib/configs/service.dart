import 'dart:async';
import 'dart:developer';

import 'package:cal_ai/configs/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

///this service runner is used to shorten the repository code.
///It returns either a Failure or type [T].
///example of usage:
///``` ServiceRunner<Failure, bool> sR = ServiceRunner(networkInfo);
///
///``` return  sR.tryRemoteandCatch(
/// call: remoteDataSource.logout(user: user),
/// errorTitle: ErrorStrings.LOG_OUT_ERROR);
class ServiceRunner<T> {
  ServiceRunner();

  ///A don't repeat yourself class,
  /// this is used for catching errors from remote data source.
  /// [call] runs a function that returns the required [Future] type.
  /// [name] string is used as the title for logs.
  /// Consider Removing some of the catch blocks.
  Future<Either<Failure, T>> run({
    required Future<T> call,
    required String name,
  }) async {
    try {
      if (kDebugMode) {
        log('$name: ${call.runtimeType}');
      }
      return Right(await call);
    } on Exception catch (e) {
      if (kDebugMode) {
        log('$name: $e');
      }
      final failure = Failure(name, e.toString());
      return Left(failure);
    }
  }
}
