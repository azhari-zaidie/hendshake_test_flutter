import 'package:flutter/material.dart';
import 'package:hendshake_test_flutter/core/result/result.dart';
import 'package:hendshake_test_flutter/features/activity/domain/entity/activity.dart';
import 'package:hendshake_test_flutter/features/history/domain/usecase/get_history_case.dart';
class HistoryProvider extends ChangeNotifier {
  final GetHistoryCase getHistoryCase;
  HistoryProvider(this.getHistoryCase);

  // HistoryProvider({required this.activityRepository});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Activity> _history = [];
  List<Activity> get history => _history;

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
          _history = history..sort((a, b) => a.price.compareTo(b.price));
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
