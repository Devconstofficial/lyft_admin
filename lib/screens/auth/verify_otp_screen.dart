import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/back_button.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

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
            CustomText(text: "Verify Your Phone Number",fontWeight: FontWeight.w600,fontSize: 24.sp,),
            8.toHeight,
            CustomText(text: "We’ve sent a verification code to your registered phone number. Enter the code below to continue.",fontWeight: FontWeight.w400,fontSize: 15.sp,),
            36.toHeight,
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.center,
              fieldWidth: 60,
              margin: EdgeInsets.only(left: 14),
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: kWhiteColor,
                  enabledBorderColor: kBlackColor,
                  borderColor: kBlackColor,
                  focusBorderColor: kPrimaryColor,
                  disabledBorderColor: kWhiteColor,
              ),
              fieldStyle: FieldStyle.box,
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              outlineBorderRadius: 14.r,
              style: const TextStyle(fontSize: 17),
              onChanged: (pin) {

              },
              onCompleted: (pin) async {},
            ),
            28.toHeight,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Don’t Receive Code?",fontWeight: FontWeight.w400,fontSize: 16.sp,),
                CustomText(text: " Resend",fontWeight: FontWeight.w600,fontSize: 16.sp,),
              ],
            ),

            149.toHeight,
            CustomButton(
              text: "Next",
              onTap: () {
                Get.toNamed(kSetNewPassScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
