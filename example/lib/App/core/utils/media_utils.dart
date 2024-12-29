import 'dart:io';
import 'package:file_picker/file_picker.dart';

class MediaUtil {
  static Future<File?> selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    String? path = result?.files.firstOrNull?.path;
    if (path == null) return null;
    return File(path);
  }

  static Future<List<File>?> selectImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);
    return result?.files.where((element) => element.path != null).map((e) => File(e.path!)).toList();
  }

  static Future<File?> selectVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
    String? path = result?.files.firstOrNull?.path;
    if (path == null) return null;
    return File(path);
  }
}