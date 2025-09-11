import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../custom_widgets/success_dialog.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: "Login to your account",fontWeight: FontWeight.w600,fontSize: 24.sp,),
            6.toHeight,
            CustomText(text: "Enter your registered email and password to access your account.",fontWeight: FontWeight.w400,fontSize: 16.sp,textAlign: TextAlign.start,),
            36.toHeight,
            CustomText(text: "Email",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
            5.toHeight,
            CustomTextField(
              fieldController: controller.emailController,
              hintText: "Enter your email address",
              keyboardType: TextInputType.number,
              prefixImage: kMailIcon,
            ),
            16.toHeight,
            CustomText(text: "Password",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
            5.toHeight,
            Obx(
                  () => CustomTextField(
                hintText: "Enter your password",
                    isObscureText: controller.isPasswordHidden.value,
                prefixImage: kLockIcon,
                    fieldController: controller.loginPassController,
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          controller.togglePasswordVisibility();
                        },
                        child: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
              ),
            ),

            6.toHeight,

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(kSendOtpScreenRoute);
                    },
                    child: CustomText(text: "Forgot Password?",fontWeight: FontWeight.w600,fontSize: 14.sp,),
                  ),
                ),
              ],
            ),
            123.toHeight,

            CustomButton(
              text: "Next",
              onTap: () {
                Get.dialog(successDialog("Login Successful", "You have successfully logged into your account.", (){
                  Get.toNamed(kDashboardScreenRoute);
                }, kPassSuccessImage, "Continue"));
                // Get.toNamed(kDashboardScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
