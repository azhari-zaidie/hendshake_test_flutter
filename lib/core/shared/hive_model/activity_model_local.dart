import 'package:hive/hive.dart';

part 'activity_model_local.g.dart';

@HiveType(typeId: 0)
class ActivityModel extends HiveObject {
  @HiveField(0)
  final String activity;
  
  @HiveField(1)
  final double accessibility;
  
  @HiveField(2)
  final String type;
  
  @HiveField(3)
  final int participants;
  
  @HiveField(4)
  final double price;
  
  @HiveField(5)
  final String link;
  
  @HiveField(6)
  // ignore: annotate_overrides
  final String key;

  @HiveField(7)
  final DateTime createdAt;

  ActivityModel({
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.createdAt,
  });
}
