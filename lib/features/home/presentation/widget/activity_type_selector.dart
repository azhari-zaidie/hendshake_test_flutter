import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';
import 'package:hendshake_test_flutter/features/home/presentation/provider/home_provider.dart';

class ActivityTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String?) onTypeChanged;

  const ActivityTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedType,
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppTheme.primaryColor,
          ),
          elevation: 2,
          style: const TextStyle(
            color: AppTheme.textPrimaryColor,
            fontSize: 16,
          ),
          onChanged: onTypeChanged,
          items: ActivityType.values.map((ActivityType value) {
            return DropdownMenuItem<String>(
              value: value.name,
              child: Row(
                children: [
                  _getIconForType(value),
                  const SizedBox(width: 12),
                  Text(
                    _formatTypeName(value.name),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _getIconForType(ActivityType type) {
    IconData iconData;
    Color iconColor;

    switch (type) {
      case ActivityType.education:
        iconData = Icons.school;
        iconColor = Colors.blue;
        break;
      case ActivityType.recreational:
        iconData = Icons.sports_basketball;
        iconColor = Colors.orange;
        break;
      case ActivityType.social:
        iconData = Icons.people;
        iconColor = Colors.green;
        break;
      case ActivityType.diy:
        iconData = Icons.build;
        iconColor = Colors.brown;
        break;
      case ActivityType.charity:
        iconData = Icons.volunteer_activism;
        iconColor = Colors.red;
        break;
      case ActivityType.cooking:
        iconData = Icons.restaurant;
        iconColor = Colors.purple;
        break;
      case ActivityType.relaxation:
        iconData = Icons.spa;
        iconColor = Colors.teal;
        break;
      case ActivityType.music:
        iconData = Icons.music_note;
        iconColor = Colors.pink;
        break;
      case ActivityType.busywork:
        iconData = Icons.work;
        iconColor = Colors.grey;
        break;
      default:
        iconData = Icons.category;
        iconColor = AppTheme.primaryColor;
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
    );
  }

  String _formatTypeName(String name) {
    return name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();
  }
} 