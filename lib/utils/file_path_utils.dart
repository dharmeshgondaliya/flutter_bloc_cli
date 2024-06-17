import 'dart:io';

extension FilePath on String {
  String actualPath() {
     String path = this;
     if (path.contains('\\')) {
       if (Platform.isLinux || Platform.isMacOS) {
         return path.replaceAll('\\', '/');
       } else {
         return path;
       }
     } else if (path.contains('/')) {
       if (Platform.isWindows) {
         return path.replaceAll('/', '\\\\');
       } else {
         return path;
       }
     } else {
       return path;
     }
  }
}