import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/utils/format.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
class HistoryList extends StatelessWidget {
  final List<Activity> history;
  final String selectedActivityType;
  const HistoryList({super.key, required this.history, required this.selectedActivityType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: history.length,
      itemBuilder: (context, index) {
        final activity = history[index];
        final isSelected = activity.type == selectedActivityType;

        return Container(
          color: isSelected ? Colors.amber.withOpacity(0.2) : null,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Text(activity.activity),
            subtitle: Text(
              '${formatDateTime(activity.createdAt)} | Price: ${activity.price}',
            ),
            trailing: Text(activity.type),
            leading: Text((index + 1).toString()),
          ),
        );
      },
    );
  }
}