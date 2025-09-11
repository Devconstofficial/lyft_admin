import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Container(
          height: 37.h,
          width: 37.w,
          decoration: BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: kPrimaryColor.withOpacity(0.25)
                )
              ]
          ),
          child: Center(child: SvgPicture.asset(kArrowBackIcon,height: 16,width: 16,)),
        ),
      ),
    );
  }
}
