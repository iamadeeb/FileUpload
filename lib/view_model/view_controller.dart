import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upload_files/services/local_db_services.dart';
import 'package:path/path.dart';
import 'package:upload_files/utils/utility.dart';
import 'package:upload_files/view/widgets/project_button.dart';

class ViewController extends GetxController {
  static ViewController to = Get.find();
  final LocalDbServices localDb = LocalDbServices();

  List<FileSystemEntity>? allSavedFiles;
  FilePickerResult? currentFilePickerResult;
  File? currentSelectedFile;
  String? currentPickedFileType;
  Directory? appDocumentsDirectory;
  String? error;
  double percent = 0;
  int bottomNavigationIndex = 0;

  @override
  Future<void> onInit() async {
    await getAppDocumentsDirectory();
    super.onInit();
  }

  Future<void> onSelectPressed() async {
    currentFilePickerResult = await FilePicker.platform.pickFiles();
    currentPickedFileType = mime(currentFilePickerResult!.files.first.name);
    currentSelectedFile = File(currentFilePickerResult!.files.first.path!);
    update();
  }

  Future<void> onUploadPressed() async {
    if (check(currentPickedFileType!)) {
      if (currentSelectedFile!.lengthSync() > 5242880) {
        error = "File size can't be more than 5MB";
        update();
      } else {
        String path =
            await getFilePath(currentFilePickerResult!.files.first.name);
        localDb.saveFile(path, currentSelectedFile!);
        createPercentData().then(
          (value) => Get.defaultDialog(
            titlePadding: EdgeInsets.all(10.h),
            contentPadding: EdgeInsets.all(10.h),
            title: "File uploaded successfully",
            barrierDismissible: false,
            content: MyButton(
              text: "OK",
              onPressed: () {
                Get.back();
                updateBottomNavigationIndex(1);
                onCancelPressed();
              },
            ),
          ),
        );
      }
    } else {
      error = "Invalid File Type";
      update();
    }
  }

  Future<void> listFiles() async {
    String path = appDocumentsDirectory!.path + "/pictures";
    if (!Directory(path).existsSync()) await Directory(path).create();
    allSavedFiles = localDb.getAllFiles(path);
  }

  Future<String> getFilePath(String fileName) async {
    String docPath =  "${appDocumentsDirectory?.path}/pictures";
    if (!Directory(docPath).existsSync()) await Directory(docPath).create();
    String filePath = '$docPath/$fileName';
    return filePath;
  }

  void onCancelPressed() {
    currentFilePickerResult = null;
    currentSelectedFile = null;
    currentPickedFileType = null;
    error = null;
    percent = 0;
    update();
  }

  Future<void> createPercentData() async {
    for (double i = 0.0; i <= 1.1; i += 0.01) {
      await Future.delayed(const Duration(milliseconds: 50));
      percent = i;
      update();
    }
  }

  void updateBottomNavigationIndex(int index) {
    bottomNavigationIndex = index;
    update();
  }

  String getTitle(int index) => basename(allSavedFiles![index].path);

  DateTime getDate(int index) => allSavedFiles![index].statSync().modified;

  String getFileSize(int index) => convertFileSize(
      ViewController.to.allSavedFiles![index].statSync().size, 0);

  String getAssetIconPath(int index) => getAssetIcon(mime(getTitle(index))!);

  Future<void> getAppDocumentsDirectory () async => appDocumentsDirectory = await getApplicationDocumentsDirectory();

  void resetErrorText() {
    error = null;
    update();
  }
}
