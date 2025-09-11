import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class CustomDialog extends StatefulWidget {
  Widget widget;
  double? intentPadding;
  double? width;
  Color? color;
  bool isWithCross;
  CustomDialog({super.key,
    required this.widget,
    this.intentPadding,
    this.width,
    this.color,
    this.isWithCross = true,
  });

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: widget.intentPadding ?? 15),
      backgroundColor: widget.color ?? kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: widget.width ?? 400.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(!widget.isWithCross)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                            spreadRadius: 0,
                            blurRadius: 4,
                            color: kPrimaryColor.withOpacity(0.25)
                          )
                        ]
                      ),
                      child: Center(child: Icon(Icons.close,size: 14,)),
                    ),
                  )
                ],
              ),
              widget.widget
            ],
          ),
        ),
      ),
    );
  }
}
