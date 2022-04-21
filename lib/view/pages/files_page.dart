import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:upload_files/utils/my_colors.dart';
import 'package:upload_files/view/widgets/my_tile.dart';
import 'package:upload_files/view_model/view_controller.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:   EdgeInsets.only(top: 40.h, bottom: 20.h),
                  child: Text(
                    "All Files",
                    style: TextStyle(fontSize: 32.r, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              GetBuilder<ViewController>(
                builder: (controller) => controller.allSavedFiles != null
                    ? Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:  ViewController.to.allSavedFiles!.length,
                          itemBuilder: (context, index) {

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: MyTile(
                                title: controller.getTitle(index),
                                date: controller.getDate(index),
                                fileSize: controller.getFileSize(index),
                                iconPath: controller.getAssetIconPath(index),
                              ),
                            );
                          }),
                    )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> init() async {
    await ViewController.to.listFiles();
    if (mounted) ViewController.to.update();
  }
}
