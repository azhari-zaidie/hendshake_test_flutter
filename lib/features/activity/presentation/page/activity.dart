import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_bar_widget.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_button.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_error_message.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_loading_indicator.dart';
import 'package:hendshake_test_flutter/features/activity/presentation/provider/activity_provider.dart';
import 'package:hendshake_test_flutter/features/activity/presentation/widget/activity_card.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    super.initState();
    // fetch activity once when widget initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ActivityProvider>(context, listen: false).getActivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Activity',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppButton(
              text: 'History',
              icon: Icons.history,
              width: 120,
              height: 40,
              onPressed: () => Navigator.pushNamed(context, AppRoute.history),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<ActivityProvider>(
          builder: (context, activityProvider, child) {
            if (activityProvider.isLoading) {
              return const AppLoadingIndicator();
            } else if (activityProvider.isError) {
              return AppErrorMessage(
                message: activityProvider.errorMessage,
                onRetry: () => activityProvider.getActivity(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  ActivityCard(activity: activityProvider.activity),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppButton(
                      text: 'Get New Activity',
                      icon: Icons.refresh,
                      onPressed: () => activityProvider.getActivity(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}