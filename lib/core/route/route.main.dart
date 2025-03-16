part of 'route.dart';

class AppRoute {
  static const String home = '/';
  static String activity = '/activity';
  
  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomeScreen(),
    // activity: (context) => const ActivityPage(),
    
  };
}