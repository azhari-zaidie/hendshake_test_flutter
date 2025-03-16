import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
import 'package:hendshake_test_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getDetails();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Center(
            child: Column(
              children: [
                // Button to navigate to the activity page
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoute.activity),
                  child: const Text('Activity'),
                ),
        
                // dropdown to select the activity type
                DropdownButton<String>(
                  value: homeProvider.selectedActivityType,
                  onChanged: (String? newValue) {
                    homeProvider.setSelectedActivityType(newValue ?? '');
                  },
                  items: ActivityType.values.map((ActivityType value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}