import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:upload_files/utils/my_colors.dart';

class MyTile extends StatefulWidget {
  final String title;
  final DateTime date;
  final String iconPath;
  final String fileSize;
  final Function()? onTileTapped;
  const MyTile(
      {Key? key,
      required this.title,
      required this.date,
      required this.fileSize,
      required this.iconPath,
      this.onTileTapped})
      : super(key: key);

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: widget.onTileTapped,
        child: Ink(
          width: 343.w,
          height: 76.h,
          decoration: BoxDecoration(
            color: MyColors.lightGray,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.w),
                decoration: BoxDecoration(
                    color: MyColors.lightBlue,
                    borderRadius: BorderRadius.circular(360)),
                height: 60.h,
                width: 60.h,
                child: Center(
                  child: Image.asset(
                    widget.iconPath,
                    height: 40.h,
                    width: 40.h,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Padding(
                padding:   EdgeInsets.fromLTRB(0, 8.w, 8.h, 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 16.r,
                            color: MyColors.black,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                      ),
                    ),

                    Text(
                      "${DateFormat("MMMM dd, yyyy",).format(widget.date)} - ${widget.fileSize}",
                      style: TextStyle(
                          fontSize: 14.r,
                          color: MyColors.gray,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
