import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:upload_files/utils/my_colors.dart';
import 'package:upload_files/view/widgets/select_file.dart';
import 'package:upload_files/view/widgets/upload_file.dart';
import 'package:upload_files/view_model/view_controller.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: GetBuilder<ViewController>(builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ViewController.to.currentFilePickerResult == null
              ? const SelectFile()
              : const UploadFile(),
        );
      }),
    );
  }
}
