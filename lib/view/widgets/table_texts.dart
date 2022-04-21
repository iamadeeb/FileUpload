import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upload_files/utils/my_colors.dart';

class TableTexts extends StatelessWidget {
  final String title;
  final String value;
  const TableTexts({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:   EdgeInsets.only(right: 20.w),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: MyColors.gray),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 16,
                  color: MyColors.black,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
              maxLines: 2,

            ),
          )
        ],
      ),
    );
  }
}
