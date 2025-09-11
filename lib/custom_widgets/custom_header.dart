import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_images.dart';
import '../utils/app_styles.dart';

 Widget customHeader(String title){
  return Row(
    children: [
      Text(
        title,
        style: AppStyles.blackTextStyle()
            .copyWith(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      Spacer(),
      Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            kPersonImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}