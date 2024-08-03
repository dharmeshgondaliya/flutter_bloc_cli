import 'dart:io';

extension FilePath on String {
  String actualPath() {
    // If the string is empty, return it as is
    if (isEmpty) return this;

    // Normalize backslashes and slashes based on the current platform
    if (Platform.isWindows) {
      // Convert slashes to backslashes for Windows
      return replaceAll('/', '\\');
    } else {
      // Convert backslashes to slashes for Unix-based systems
      return replaceAll('\\', '/');
    }
  }
}