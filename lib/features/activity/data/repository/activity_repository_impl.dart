import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/result/error/failure.dart';
import 'package:hendshake_test_flutter/features/activity/data/datasource/activity_ds.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
import 'package:hendshake_test_flutter/features/activity/domain/repository/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityDs activityDs;
  ActivityRepositoryImpl(this.activityDs);

  @override
  Future<Either<Failure, Activity>> getActivity() async {
    try{
      final result = await activityDs.getActivity();
      return right(result);
    }catch(e){
      return left(Failure(e.toString()));
    }
  }
}