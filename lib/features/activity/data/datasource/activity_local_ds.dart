import 'package:hendshake_test_flutter/core/shared/hive_model/activity_model_local.dart';
import 'package:hendshake_test_flutter/features/activity/data/model/activity_model.dart' as domain;
import 'package:hive/hive.dart';

abstract interface class ActivityLocalDs {
  Future<void> saveActivity(domain.ActivityModel activity);
}

class ActivityLocalDsImpl implements ActivityLocalDs {
  static const String _boxName = 'activities';
  // static const String _lastActivityKey = 'last_activity';

  // save activity to local storage
  @override
  Future<void> saveActivity(domain.ActivityModel activity) async {
    final box = await Hive.openBox<ActivityModel>(_boxName);
    
    // Convert domain ActivityModel to Hive ActivityModel
    final hiveActivity = ActivityModel(
      activity: activity.activity,
      accessibility: activity.accessibility,
      type: activity.type,
      participants: activity.participants,
      price: activity.price,
      link: activity.link,
      key: activity.key,
      createdAt: activity.createdAt,
    );
    
    await box.add(hiveActivity);
  }
}