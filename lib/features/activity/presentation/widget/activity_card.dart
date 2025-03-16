import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
import 'package:hendshake_test_flutter/features/activity/presentation/widget/activity_detail_item.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              activity.activity,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ActivityDetailItem(
                  icon: Icons.category,
                  label: 'Type',
                  value: activity.type,
                ),
                const Divider(),
                ActivityDetailItem(
                  icon: Icons.people,
                  label: 'Participants',
                  value: activity.participants.toString(),
                ),
                const Divider(),
                ActivityDetailItem(
                  icon: Icons.attach_money,
                  label: 'Price',
                  value: _formatPrice(activity.price),
                ),
                if (activity.link.isNotEmpty) ...[
                  const Divider(),
                  ActivityDetailItem(
                    icon: Icons.link,
                    label: 'Link',
                    value: activity.link,
                    isLink: true,
                  ),
                ],
                const Divider(),
                ActivityDetailItem(
                  icon: Icons.key,
                  label: 'Key',
                  value: activity.key,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatPrice(double price) {
    if (price == 0) return 'Free';
    if (price < 0.3) return 'Low';
    if (price < 0.6) return 'Medium';
    return 'High';
  }
}