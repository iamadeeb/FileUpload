import 'dart:math';
import 'package:intl/intl.dart';
import 'package:upload_files/view_model/view_controller.dart';


String getAssetIcon(String fileType) {
  switch (fileType) {
    case "application/msword":
      return "assets/doc.png";
    case "application/pdf":
      return "assets/pdf.png";
    case "video/mp4":
      return "assets/mp4.png";
    case "audio/mpeg":
      return "assets/mp3.png";
    case "image/jpeg":
      return "assets/jpg.png";
    case "image/png":
      return "assets/png.png";
    default:
      return "assets/invalid.png";
  }
}

bool check (String fileType) {
  switch (fileType) {
    case "application/msword":
      return true;
    case "application/pdf":
      return true;
    case "video/mp4":
      return true;
    case "audio/mpeg":
      return true;
    case "image/jpeg":
      return true;
    case "image/png":
      return true;
    default:
      return false;
  }
}

String convertFileSize(int fileSize, int decimals) {
  int bytes = fileSize;
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
}

String getDate() {
  DateTime date = ViewController.to.currentSelectedFile!.statSync().modified;
  return DateFormat(
    "MMMM dd, yyyy",
  ).format(date);
}
