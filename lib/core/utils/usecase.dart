import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
