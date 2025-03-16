import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_bar_widget.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_button.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_error_message.dart';
import 'package:hendshake_test_flutter/core/shared/widgets/app_loading_indicator.dart';
import 'package:hendshake_test_flutter/features/history/presentation/provider/history_provider.dart';
import 'package:hendshake_test_flutter/features/history/presentation/widget/history_list.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HistoryProvider>(context, listen: false).getInfoProvider.getInfo();
      Provider.of<HistoryProvider>(context, listen: false).getHistory();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Activity History',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppButton(
              text: 'Home',
              icon: Icons.home,
              width: 100,
              height: 40,
              onPressed: () {
                // back to home page
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  AppRoute.home, 
                  (route) => false
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: Consumer<HistoryProvider>(
          builder: (context, historyProvider, child) {
            if(historyProvider.isLoading){
              return const AppLoadingIndicator();
            } else if(historyProvider.isError){
              return AppErrorMessage(
                message: historyProvider.errorMessage,
                onRetry: () => historyProvider.getHistory(),
              );
            }
            
            if (historyProvider.history.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.history,
                      size: 64,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No activity history yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Try some activities to see them here',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: 'Find Activities',
                      icon: Icons.search,
                      onPressed: () => Navigator.pushNamed(
                        context, 
                        AppRoute.activity,
                      ),
                    ),
                  ],
                ),
              );
            }
            
            return HistoryList(
              history: historyProvider.history, 
              selectedActivityType: historyProvider.getInfoProvider.activityType
            );
          },
        ),
      ),
    );
  }
}
