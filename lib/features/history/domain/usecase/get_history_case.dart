import 'package:fpdart/fpdart.dart';
import 'package:hendshake_test_flutter/core/result/error/failure.dart';
import 'package:hendshake_test_flutter/features/activity/data/model/activity_model.dart';
import 'package:hendshake_test_flutter/features/history/domain/repository/history_repository.dart';

class GetHistoryCase {
  final HistoryRepository historyRepository;
  GetHistoryCase(this.historyRepository);
  
  Future<Either<Failure, List<ActivityModel>>> call() async {
    return await historyRepository.getLastActivity();
  }
}
