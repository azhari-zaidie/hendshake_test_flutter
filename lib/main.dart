import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/shared/provider/get_info_provider.dart';
import 'package:hendshake_test_flutter/core/shared/theme/app_theme.dart';
import 'package:hendshake_test_flutter/features/activity/presentation/provider/activity_provider.dart';
import 'package:hendshake_test_flutter/features/history/presentation/provider/history_provider.dart';
import 'package:hendshake_test_flutter/features/home/presentation/provider/home_provider.dart';
import 'package:hendshake_test_flutter/init_dependencies.main.dart';
import 'package:provider/provider.dart';
import 'package:hendshake_test_flutter/core/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependencies
  await initDependencies();

  // run app
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => serviceLocator<HomeProvider>()),
        ChangeNotifierProvider(create: (context) => serviceLocator<ActivityProvider>()),
        ChangeNotifierProvider(create: (context) => serviceLocator<HistoryProvider>()),
        ChangeNotifierProvider(create: (context) => serviceLocator<GetInfoProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      initialRoute: AppRoute.home,
      routes: AppRoute.routes,
      title: 'Hendshake Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
