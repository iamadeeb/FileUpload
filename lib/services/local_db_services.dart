import 'dart:io';

class LocalDbServices {
  void saveFile(String path, File file) {
    File(path).writeAsBytesSync(file.readAsBytesSync());
  }

  List<FileSystemEntity> getAllFiles(String path) {
    return Directory(path).listSync(recursive: true);
  }
}
