import 'dart:io';
import 'dart:math' as math;

import 'package:file_picker/file_picker.dart';

class FileService {
  static Future<File?> pickFile({List<String>? extensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: extensions != null ? FileType.custom : FileType.any,
      allowedExtensions: extensions
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } 
    return null;
  }

  static Future<File?> pickImage({List<String>? extensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowedExtensions: extensions
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    }
    return null;
  }

  static Future<List<File>?> pickFiles({List<String>? extensions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: extensions,
      type: extensions != null ? FileType.custom : FileType.any,
    );
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    }
    return null;
  }

  static String formatBytes(int bytes, int decimals) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}