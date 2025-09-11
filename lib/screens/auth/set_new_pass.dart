import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/custom_widgets/success_dialog.dart';
import 'package:lyft_admin/utils/app_strings.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/back_button.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/custom_textfield.dart';
import 'controller/auth_controller.dart';

class SetNewPassScreen extends GetView<AuthController> {
  const SetNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BackButtonWidget(),
            34.toHeight,
            CustomText(text: "Create a New Password",fontWeight: FontWeight.w600,fontSize: 24.sp,),
            8.toHeight,
            CustomText(text: "Create a strong new password to secure your account and log in again.",fontWeight: FontWeight.w400,fontSize: 16.sp,),
            36.toHeight,
            CustomText(text: "Password",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
            5.toHeight,
            Obx(
                  () => CustomTextField(
                hintText: "Enter your password",
                    isObscureText: controller.isPasswordHidden1.value,
                prefixImage: kLockIcon,
                fieldController: controller.newPassController,
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          controller.togglePasswordVisibility1();
                        },
                        child: Icon(
                          controller.isPasswordHidden1.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),

                  ),
            ),
            24.toHeight,
            CustomText(text: "Confirm Password",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
            5.toHeight,
            Obx(
                  () => CustomTextField(
                hintText: "Enter your password",
                    isObscureText: controller.isPasswordHidden2.value,
                prefixImage: kLockIcon,
                fieldController: controller.confirmPassController,
                suffixIcon: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      controller.togglePasswordVisibility2();
                    },
                    child: Icon(
                      controller.isPasswordHidden2.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kPrimaryColor,

                    ),
                  ),
                ),
              ),
            ),
            149.toHeight,
            CustomButton(
              text: "Next",
              onTap: () {
                Get.dialog(successDialog("Password Updated", "Your password has been updated successfully.", (){
                  Get.toNamed(kAuthScreenRoute);
                }, kPassSuccessImage, "Continue"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
