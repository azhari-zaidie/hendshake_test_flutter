import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInfoProvider extends ChangeNotifier {
  SharedPreferences localStorage;
  GetInfoProvider(this.localStorage);

  String _activityType = 'none';  
  String get activityType => _activityType;

  Future<void> getInfo() async {
    String info = await localStorage.getString('selectedActivityType') ?? 'none';
    _activityType = info;
    notifyListeners();
  }
}
