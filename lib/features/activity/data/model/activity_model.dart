import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';

class ActivityModel extends Activity {
  ActivityModel({
    required super.activity,
    required super.accessibility,
    required super.type,
    required super.participants,
    required super.price,
    required super.link,
    required super.key,
    required super.createdAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      activity: json['activity'] ?? '',
      accessibility: double.parse(json['accessibility'].toString()),
      type: json['type'] ?? '',
      participants: int.parse(json['participants'].toString()),
      price: double.parse(json['price'].toString()),
      link: json['link'] ?? '',
      key: json['key'] ?? '',
      createdAt: DateTime.now(),
    );
  }

  ActivityModel copyWith({
    String? activity,
    double? accessibility,
    String? type,
    int? participants,
    double? price,
    String? link,
    String? key,
    DateTime? createdAt,
  }) {
    return ActivityModel(
      activity: activity ?? this.activity,
      accessibility: accessibility ?? this.accessibility,
      type: type ?? this.type,
      participants: participants ?? this.participants,
      price: price ?? this.price,
      link: link ?? this.link,
      key: key ?? this.key,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
