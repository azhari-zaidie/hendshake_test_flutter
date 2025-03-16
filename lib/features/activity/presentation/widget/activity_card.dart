import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name : ${activity.activity}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Type : ${activity.type}',
              textAlign: TextAlign.center,
            ),
            Text(
              'Participants : ${activity.participants}',
              textAlign: TextAlign.center,
            ),
            Text(
              'Price : ${activity.price}',
              textAlign: TextAlign.center,
            ),
            Text(
              'Link : ${activity.link}',
              textAlign: TextAlign.center,
            ),
            Text(
              'Key : ${activity.key}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}