import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

Widget insightContainer(String img, String title, String detail) {
  return Container(
    width: 244.w,
    height: 117.h,
    decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
              color: kBlackColor.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 1)
          )
        ]
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 19.h,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8.w,
            children: [
              Image.asset(
                img,
                height: 24.h,
                width: 24.w,
                color: kPrimaryColor,
              ),
              Text(
                title,
                style: AppStyles.blackTextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          Text(
            detail,
            style: AppStyles.blackTextStyle().copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 24.sp,
              color: kBlackColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    ),
  );
}