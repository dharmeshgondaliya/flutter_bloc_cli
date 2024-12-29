abstract class CreateCommand {
  String get successMessage;
  Future<void> execute();
}
