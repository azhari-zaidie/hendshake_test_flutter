part of 'route.dart';

// main route
class AppRoute {
  static const String home = '/';
  static const String activity = '/activity';
  static const String history = '/history';
  
  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomeScreen(),
    activity: (context) => const ActivityScreen(),
    history: (context) => const HistoryScreen(),
  };
}