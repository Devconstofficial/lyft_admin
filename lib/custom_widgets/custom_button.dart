import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double borderRadius;
  final FontWeight? fontWeight;
  final VoidCallback onTap;
  bool? isImage = false;
  String? image;

  CustomButton(
      {super.key,
        required this.text,
        this.color,
        this.textColor,
        this.width,
        this.height,
        required this.onTap,
        this.isImage,
        this.image,
        this.borderColor,
        this.fontSize,
        this.fontWeight,
        this.borderRadius = 16,
      });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 74.h,
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? kPrimaryColor),
              borderRadius: BorderRadius.circular(borderRadius),
              color: color ?? kPrimaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              isImage == true ? Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppStyles.blackTextStyle().copyWith(fontSize: fontSize ?? 18.sp,fontWeight: fontWeight ?? FontWeight.w700,color: textColor ?? kWhiteColor)
              )
                  : Expanded(child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppStyles.whiteTextStyle().copyWith(fontSize: fontSize ?? 18.sp,fontWeight: FontWeight.w700,color: textColor ?? kWhiteColor)
              ),
              ),
              if(isImage == true)
                SizedBox(width: 10.w),
              if(isImage == true)
                Image.asset(image!,height: 24,width: 24,),

            ],
          ),
        ),
      ),
    );
  }
}
