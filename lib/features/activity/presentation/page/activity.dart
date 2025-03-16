import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
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
      appBar: AppBar(
        title: const Text('Activity'),
        actions: [
          ElevatedButton(onPressed: (){
            // go to history page
            Navigator.pushNamed(context, AppRoute.history);
          }, child: Row(children: [
            Icon(Icons.history),
            Text('History'),
          ],))
        ],
      ),
      body:  Consumer<ActivityProvider>(
        builder: (context, activityProvider, child) {
          if(activityProvider.isLoading){
            return const Center(child: CircularProgressIndicator());
          }else if(activityProvider.isError){
            return Center(child: Text(activityProvider.errorMessage, textAlign: TextAlign.center,));
          }
          return ActivityCard(activity: activityProvider.activity);
        },
      ),
    );
  }
}