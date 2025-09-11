import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_text.dart';

locationTile({
  required String title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppStyles.blackTextStyle().copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

Widget rideContainer(price, loc1, loc2, loc3){
  return Container(
    decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              spreadRadius: 0,
              blurRadius: 4,
              color: kPrimaryColor.withOpacity(0.25)
          )
        ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 18.0.h,left: 16.w),
          child: CustomText(text: "\$$price",fontWeight: FontWeight.w500,fontSize: 18,),
        ),
        Divider(
          endIndent: 0,
          indent: 0,
          color: kCreamColor3.withOpacity(0.7),
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    kMarkerIcon,
                    height: 24,
                    width: 24,
                  ),
                  Container(
                    height: 33,
                    width: 2,
                    color: kPrimaryColor,
                  ),
                  Image.asset(
                    kStopIcon,
                    height: 24,
                    width: 24,
                  ),
                  Container(
                    height: 33,
                    width: 2,
                    color: kPrimaryColor,
                  ),
                  Image.asset(
                    kLocationIcon,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              12.toWidth,
              Expanded(
                child: SizedBox(
                  height: 140,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      locationTile(
                        title: loc1,
                      ),
                      locationTile(
                        title: loc2,
                      ),
                      locationTile(
                        title: loc3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}