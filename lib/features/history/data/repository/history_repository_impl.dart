import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/result/error/failure.dart';
import 'package:hendshake_test_flutter/features/activity/data/model/activity_model.dart';
import 'package:hendshake_test_flutter/features/history/data/datasource/history_ds.dart';
import 'package:hendshake_test_flutter/features/history/domain/repository/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDs historyDs;
  HistoryRepositoryImpl(this.historyDs);
  @override
  Future<Either<Failure, List<ActivityModel>>> getLastActivity() async {
    try{
      final result = await historyDs.getLastActivity();
      return right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}