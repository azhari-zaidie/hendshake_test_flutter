class ServerException implements Exception{
  final String message;
  const ServerException(this.message);

  @override
  /// TODO :: tukar server exception ni akan datang
  String toString() => 'ServerException: $message';
}
