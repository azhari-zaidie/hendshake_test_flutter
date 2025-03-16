class ReturnResult<T> {
  final T? data;
  final bool isSuccess;
  final String? error;
  final String? message;
  final String? code;

  const ReturnResult.success(this.data, this.message, this.code) : isSuccess = true, error = null;
  const ReturnResult.failure(this.error, this.message, this.code) : isSuccess = false, data = null;

  // bool get isSuccess => isSuccess;
  // bool get isFailure => !isSuccess;
}
