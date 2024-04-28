class CliException implements Exception {
  CliException({required this.message});
  final String message;
  @override
  String toString() => message;
}
