import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:upload_files/utils/my_colors.dart';
import 'package:upload_files/utils/utility.dart';
import 'package:upload_files/view/widgets/project_button.dart';
import 'package:upload_files/view/widgets/table_texts.dart';
import 'package:upload_files/view_model/view_controller.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {

  @override
  Widget build(BuildContext context) {
    String assetIcon = getAssetIcon(ViewController.to.currentPickedFileType!);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 120.h, bottom: 20.h),
        child: GetBuilder<ViewController>(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CircularPercentIndicator(
                  animation: true,
                  animateFromLastPercent: true,
                  backgroundColor: MyColors.lightGray,
                  radius: 212.h,
                  lineWidth: 14.h,
                  percent: ViewController.to.percent.clamp(0.0, 1.0),
                  center: SizedBox(
                    width: 133.h,
                    child: Center(child:   Image.asset(assetIcon, height: 100.h, width: 100.h),),
                  ),
                  progressColor: MyColors.blue,
                  circularStrokeCap: CircularStrokeCap.round,
                ),

                Text(
                  ViewController.to.error ?? "",
                  style: const TextStyle(fontSize: 16, color: MyColors.red),
                ),
                Container(
                  padding: EdgeInsets.all(24.h),
                  width: 343.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: MyColors.lightestBlue,
                  ),
                  child: Column(
                    children: [
                      TableTexts(
                        title: "File Name",
                        value: ViewController
                            .to.currentFilePickerResult!.files.first.name,
                      ),
                      const Divider(),
                      TableTexts(
                        title: "Created Date",
                        value: getDate(),
                      ),
                      const Divider(),
                      TableTexts(
                        title: "File Size",
                        value: convertFileSize(
                            ViewController
                                .to.currentFilePickerResult!.files.first.size,
                            0),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      text: "Cancel",
                      width: 150.w,
                      onPressed: () => ViewController.to.onCancelPressed(),
                    ),
                    MyButton(
                      text: "Upload",
                      width: 150.w,
                      onPressed: () async =>
                          await ViewController.to.onUploadPressed(),
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
