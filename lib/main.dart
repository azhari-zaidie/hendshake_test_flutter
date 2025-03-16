import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      initialRoute: AppRoute.home,
      routes: AppRoute.routes,
      title: 'Hendshake Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
