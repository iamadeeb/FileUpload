import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upload_files/utils/my_colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Color? buttonColor;
  final double? radius;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  const MyButton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.buttonColor,
      this.radius,
      this.height,
      this.width,
      this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.transparent,
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(50.r),
        onTap: onPressed,
        child: Ink(
          height: height ?? 56,
          width: width ?? 311,
          decoration: BoxDecoration(
              color: buttonColor ?? MyColors.blue,
              borderRadius: BorderRadius.circular(radius ?? 50.r)),
          child: Center(
            child: Text(text!,
                style: textStyle ??
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColors.white)),
          ),
        ),
      ),
    );
  }
}
