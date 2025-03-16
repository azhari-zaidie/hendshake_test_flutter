import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';
import 'package:hendshake_test_flutter/core/utils/format.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';

class HistoryList extends StatelessWidget {
  final List<Activity> history;
  final String selectedActivityType;
  
  const HistoryList({
    super.key, 
    required this.history, 
    required this.selectedActivityType
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final activity = history[index];
        final isSelected = activity.type == selectedActivityType;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSelected 
                ? BorderSide(color: AppTheme.primaryColor, width: 2) 
                : BorderSide.none,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              activity.activity,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildInfoChip(
                      Icons.calendar_today, 
                      formatDateTime(activity.createdAt),
                      Colors.blue.shade100,
                    ),
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      Icons.attach_money, 
                      activity.price.toString(),
                      Colors.green.shade100,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildInfoChip(
                  Icons.category, 
                  activity.type,
                  isSelected 
                      ? AppTheme.primaryColor.withOpacity(0.2) 
                      : Colors.purple.shade100,
                ),
              ],
            ),
            isThreeLine: true,
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildInfoChip(IconData icon, String label, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}