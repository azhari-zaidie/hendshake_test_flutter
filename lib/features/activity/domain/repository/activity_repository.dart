import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/result/error/failure.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';

abstract interface class ActivityRepository {
  Future<Either<Failure, Activity>> getActivity({
    required String activityType,
  });
}
