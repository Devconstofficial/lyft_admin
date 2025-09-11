import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/custom_widgets/back_button.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class SendOtpScreen extends GetView<AuthController> {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BackButtonWidget(),
            34.toHeight,
            CustomText(text: "Forgot Password",fontWeight: FontWeight.w600,fontSize: 24.sp,),
            14.toHeight,
            CustomText(text: "Enter your registered email and we’ll send you instructions to reset your password.",fontWeight: FontWeight.w400,fontSize: 16.sp,),
            36.toHeight,
            CustomText(text: "Email",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
            5.toHeight,
            CustomTextField(
              fieldController: controller.emailController,
              hintText: "Enter your email address",
              keyboardType: TextInputType.number,
              prefixImage: kMailIcon,
            ),
            SizedBox(height: 149.h),
            CustomButton(
              text: "Next",
              onTap: () {
                Get.toNamed(kVerifyOtpScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
