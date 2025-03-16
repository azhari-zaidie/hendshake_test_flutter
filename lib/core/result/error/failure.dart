class Failure {
  final String message;
  final StackTrace? stackTrace;

  Failure([this.message = 'An unexpected error occur', this.stackTrace]);
}

