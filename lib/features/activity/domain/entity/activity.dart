// Activity entity
// Separate from model to avoid circular dependency
class Activity {
  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final DateTime createdAt;

  const Activity({
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