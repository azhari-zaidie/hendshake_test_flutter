import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/result/error/failure.dart';
import 'package:hendshake_test_flutter/core/utils/usecase.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
import 'package:hendshake_test_flutter/features/activity/domain/repository/activity_repository.dart';

class GetActivityCase implements UseCase<Activity, String> {
  final ActivityRepository activityRepository;
  GetActivityCase(this.activityRepository);

  @override
  Future<Either<Failure, Activity>> call(String activityType) async {
    return await activityRepository.getActivity(activityType: activityType);
  }
}