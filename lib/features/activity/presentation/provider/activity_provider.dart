import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/result/result.dart';
import 'package:hendshake_test_flutter/core/utils/usecase.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
import 'package:hendshake_test_flutter/features/activity/domain/usecase/get_activity_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityProvider extends ChangeNotifier {
  final SharedPreferences localStorage;
  final GetActivityCase getActivityCase;
  ActivityProvider(
    this.localStorage,
    this.getActivityCase,
  );

  // granular loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // error handling
  bool _isError = false;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  bool get isError => _isError;

  // List<Activity> _listActivity = [];
  // List<Activity> get listActivity => _listActivity;

  Activity _activity = Activity(
    activity: '',
    accessibility: 0,
    type: '',
    participants: 0,
    price: 0,
    link: '',
    key: '',
    createdAt: DateTime.now(),
  );
  Activity get activity => _activity;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<ReturnResult> getActivity() async {
    isLoading = true;
    notifyListeners();
    try{
      final result = await getActivityCase.call(NoParams());
      return result.fold(
        (failure) {
          _isError = true;
          _errorMessage = failure.message;
          return ReturnResult.failure(failure.toString(), 'Failed to get activity', '500');
        },
        (activity) {
          _activity = activity;
          clearError();
          return ReturnResult.success(activity, 'Successfully get activity', '200');
        },
      );
    }catch(e){
      _isError = true;
      _errorMessage = e.toString();
      return ReturnResult.failure(e.toString(), 'Failed to get activity', '500');
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }

  // clear error
  void clearError(){
    _isError = false;
    _errorMessage = '';
    notifyListeners();
  }
}

