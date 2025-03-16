import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
import 'package:hendshake_test_flutter/features/history/presentation/provider/history_provider.dart';
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
      body: Consumer<HistoryProvider>(
        builder: (context, historyProvider, child) {
          if(historyProvider.isLoading){
            return const Center(child: CircularProgressIndicator());
          }else if(historyProvider.isError){
            return Center(child: Text(historyProvider.errorMessage, textAlign: TextAlign.center,));
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: historyProvider.history.length,
            itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: Text(historyProvider.history[index].activity),
              subtitle: Text(
                '${_formatDateTime(historyProvider.history[index].createdAt)} | Price: ${historyProvider.history[index].price}',
              ),
              trailing: Text(historyProvider.history[index].type),
              leading: Text((index+1).toString()),
            );
          },);
        },
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
