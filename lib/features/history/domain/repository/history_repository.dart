import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/result/error/failure.dart';
import 'package:hendshake_test_flutter/features/activity/data/model/activity_model.dart';

abstract interface class HistoryRepository {
  Future<Either<Failure, List<ActivityModel>>> getLastActivity();
}