import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/result/result.dart';
import 'package:hendshake_test_flutter/core/shared/provider/get_info_provider.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
import 'package:hendshake_test_flutter/features/history/domain/usecase/get_history_case.dart';
import 'package:hendshake_test_flutter/init_dependencies.main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HistoryProvider extends ChangeNotifier {
  final GetHistoryCase getHistoryCase;
  final GetInfoProvider getInfoProvider;
  HistoryProvider(this.getHistoryCase, this.getInfoProvider);

  // HistoryProvider({required this.activityRepository});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Activity> _history = [];
  List<Activity> get history => _history;

  String selectedActivityType = serviceLocator<SharedPreferences>().getString('selectedActivityType') ?? 'none';

  Future<ReturnResult> getHistory() async {
    _isLoading = true;
    notifyListeners();
    try{
      final result = await getHistoryCase.call();

      return result.fold(
        (failure){
          _isError = true;
          _errorMessage = failure.message;
          return ReturnResult.failure(failure.message, 'Error', '500');
        },
        (history) {
          resetError();
          // the history is sorted by latest activity
          // _history = history..sort((a, b) => a.price.compareTo(b.price));
          _history = history;
          // print('history: ${_history.map((e) => e.activity)}');
          return ReturnResult.success(history, 'Success', '200');
        },
      );
    } catch (e) {
      _isError = true;
      _errorMessage = e.toString();
      return ReturnResult.failure(e.toString(), 'Error', '500');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetError() {
    _isError = false;
    _errorMessage = '';
    notifyListeners();
  }
}
