import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../utils/app_colors.dart';
import 'custom_button.dart';
import 'custom_dialouge.dart';
import 'custom_text.dart';


Widget successDialog(title,detail,VoidCallback onTap,image,btnTitle,{bool isCancel = false,String cancelBtnText = 'Cancel',VoidCallback? onCancelTap}){
  return CustomDialog(
      widget: Column(
        children: [
          SizedBox(
              height: 100.h,
              width: 100.w,
              child: SvgPicture.asset(image,fit: BoxFit.cover,)),
          21.toHeight,
          CustomText(text: title,fontSize: 24.sp,fontWeight: FontWeight.w500,),
          8.toHeight,
          CustomText(text: detail,fontSize: 16.sp,fontWeight: FontWeight.w400,color: kBlackColor,textAlign: TextAlign.center,),
          21.toHeight,
          CustomButton(
              text: btnTitle,
              onTap: onTap
          ),
          if(isCancel == true) ...[
            11.toHeight,
            CustomButton(
                text: cancelBtnText,
                color: kWhiteColor,
                textColor: kBlackColor,
                onTap: onCancelTap ?? (){}
            ),
          ]
        ],
      )
  );
}