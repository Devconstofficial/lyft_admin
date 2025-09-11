import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import 'custom_button.dart';
import 'custom_dialouge.dart';
import 'custom_text.dart';

Widget deleteUser(){
  return CustomDialog(
    width: 390.w,
    widget: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
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
                ),
              )
            ],
          ),
          17.toHeight,
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(kPersonImage,height: 115,width: 115,)),
          13.toHeight,
          CustomText(text: "Johan",fontWeight: FontWeight.w600,fontSize: 24,),

          23.toHeight,
          CustomText(text: "Are you sure you want to delete this user’s account? This action cannot be undone. All user data, including rides history, payments, and disputes, will be permanently removed.",fontWeight: FontWeight.w400,fontSize: 16,textAlign: TextAlign.center,),

          17.toHeight,
          CustomButton(text: "Delete", onTap: (){
            Get.back();
          },height: 62.h,fontWeight: FontWeight.w500,fontSize: 18.sp,),
        ],
      ),
    ),);
}
