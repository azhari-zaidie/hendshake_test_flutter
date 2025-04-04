import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// list of activity types
enum ActivityType {
  none,
  education,
  recreational,
  social,
  diy,
  charity,
  cooking,
  relaxation,
  music,
  busywork,
}

class HomeProvider extends ChangeNotifier {
  SharedPreferences localStorage;
  HomeProvider(this.localStorage);

  String _selectedActivityType = 'none';
  String get selectedActivityType => _selectedActivityType;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setSelectedActivityType(String value) {
    _selectedActivityType = value;
    // save the selected activity type to local storage
    localStorage.setString('selectedActivityType', value);
    notifyListeners();
  }

  // get details
  Future<void> getDetails() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      // get the selected activity type from local storage
      final selectedActivityType = localStorage.getString('selectedActivityType');
      _selectedActivityType = selectedActivityType ?? 'none';
    } catch (e) {
      // Handle any errors
      debugPrint('Error loading preferences: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
