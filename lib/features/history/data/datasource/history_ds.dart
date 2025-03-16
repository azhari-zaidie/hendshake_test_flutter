import 'package:hendshake_test_flutter/core/result/error/exception.dart';
import 'package:hendshake_test_flutter/core/shared/hive_model/activity_model_local.dart';
import 'package:hendshake_test_flutter/features/activity/data/model/activity_model.dart' as domain;
import 'package:hive/hive.dart';

abstract interface class HistoryDs {
  Future<List<domain.ActivityModel>> getLastActivity();
}

class HistoryDsImpl implements HistoryDs {
  static const String _boxName = 'activities';

  // get last activity from local storage
  @override
  Future<List<domain.ActivityModel>> getLastActivity() async {
    try{
      final box = await Hive.openBox<ActivityModel>(_boxName);
      final activities = box.values.toList();
      // sort by createdAt
      activities.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      // Convert Hive ActivityModel to domain ActivityModel
      final domainActivities = activities.map((hiveActivity) => 
        domain.ActivityModel(
          activity: hiveActivity.activity,
          accessibility: hiveActivity.accessibility,
          type: hiveActivity.type,
          participants: hiveActivity.participants,
          price: hiveActivity.price,
          link: hiveActivity.link,
          key: hiveActivity.key,
          createdAt: hiveActivity.createdAt,
        )
      ).toList();
      
      // return 50 latest activities
      return domainActivities.take(50).toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
