import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upload_files/utils/my_colors.dart';
import 'package:upload_files/view/pages/files_page.dart';
import 'package:upload_files/view/pages/upload_page.dart';
import 'package:upload_files/view_model/view_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ViewController vController = Get.put(ViewController());
  static final List<Widget> widgetOptions = <Widget>[
    const UploadPage(),
    const FilesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColors.white,
        body: Center(
          child: widgetOptions.elementAt(controller.bottomNavigationIndex),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            backgroundColor: MyColors.white,
            type: BottomNavigationBarType.fixed,
            enableFeedback: true,
            items: <BottomNavigationBarItem>[
              bottomNavigationBarItem(Icons.cloud_upload, "Upload Files"),
              bottomNavigationBarItem(Icons.file_copy_sharp, "All Files"),
            ],
            currentIndex: controller.bottomNavigationIndex,
            selectedLabelStyle:
                const TextStyle(fontSize: 12, color: MyColors.blue),
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, color: MyColors.lightBlue),
            unselectedItemColor: MyColors.lightBlue,
            onTap: (index) => controller.updateBottomNavigationIndex(index),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      IconData? icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: MyColors.lightBlue,
      ),
      label: label,
      tooltip: '',
      activeIcon: Icon(
        icon,
        color: MyColors.blue,
      ),
    );
  }
}
