import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle blackTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kBlackColor,
    );
  }

  static TextStyle primaryTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kPrimaryColor,
    );
  }


  static TextStyle whiteTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kWhiteColor,
    );
  }

  static TextStyle greyTextStyle() {
    return GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: kGreyColor,
    );
  }

  static BorderRadius get customBorder16 => BorderRadius.all(
    Radius.circular(16.r),
  );
}
