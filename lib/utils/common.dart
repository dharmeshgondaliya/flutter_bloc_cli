import 'dart:io';

Future<bool> checkFileExist(String path) async {
  return File(path).exists();
}

Future<bool> checkDirectoryExist(String path) async {
  return Directory(path).exists();
}

String capitalizeFirst(String s) {
  if (s.isEmpty || s.length == 1) return s;
  return s[0].toUpperCase() + s.substring(1).toLowerCase();
}
