import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            // Dropdown to select the activity type
            // DropdownButton<String>(
            //   value: selectedActivityType,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       selectedActivityType = newValue;
            //     });
            //   },
            //   items: activityTypes.map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}