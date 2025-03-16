import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
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
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            // back to home page
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.home, (route) => false);
          }, icon: const Icon(Icons.home))
        ],
        title: const Text('History'),
      ),
      body: SafeArea(
        bottom: true,
        child: Consumer<HistoryProvider>(
          builder: (context, historyProvider, child) {
            if(historyProvider.isLoading){
              return const Center(child: CircularProgressIndicator());
            }else if(historyProvider.isError){
              return Center(child: Text(historyProvider.errorMessage, textAlign: TextAlign.center,));
            }
            return HistoryList(
              history: historyProvider.history, 
              selectedActivityType: historyProvider.getInfoProvider.activityType);
          },
        ),
      ),
    );
  }
}
