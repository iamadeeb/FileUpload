import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upload_files/utils/my_colors.dart';
import 'package:upload_files/view/widgets/project_button.dart';
import 'package:upload_files/view_model/view_controller.dart';

class SelectFile extends StatelessWidget {
  const SelectFile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Text(
                "Upload File",
                style: TextStyle(fontSize: 32.r, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12.r),
            padding: EdgeInsets.all(20.r),
            color: MyColors.gray,
            dashPattern: [7.w, 8.w],
            child: Container(
              height: 250.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/folder_icon.png",
                          height: 100.h, width: 100.h),
                      SizedBox(height: 20.h),
                      const Text(
                        "Select one of the following file types: \n JPG, PNG, PDF, DOC, MP3, MP4 \n Files can't be more than 5 MB.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: MyColors.gray),
                      ),
                    ],
                  ),
                  MyButton(
                    text: "Select",
                    width: 230.w,
                    onPressed: () => ViewController.to.onSelectPressed(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
