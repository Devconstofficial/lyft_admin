import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/custom_widgets/custom_textfield.dart';
import 'package:lyft_admin/screens/vehicle_settings/controller/settings_controller.dart';
import 'package:lyft_admin/utils/app_images.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_dialouge.dart';
import '../../custom_widgets/custom_header.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/delete_user.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class VehicleSettingsScreen extends GetView<VehicleSettingsController> {
  const VehicleSettingsScreen({super.key});

  titleRow(image,title,{bool isDollar = false}){
    return Row(
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle
          ),
          child: Center(child: isDollar ? CustomText(text: "\$",fontWeight: FontWeight.w600,fontSize: 18,color: kWhiteColor,) : SvgPicture.asset(image,height: 17,width: 17,)),
        ),
        14.toWidth,
        CustomText(text: title,fontWeight: FontWeight.w600,fontSize: 18,color: kLightGreyColor2,),
      ],
    );
  }

  feeContainer(title,detail,value,sign){
    return Container(
      width: 205.w,
      height: 125.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: kCreamColor4,
            width: 0.6
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: title,fontWeight: FontWeight.w600,fontSize: 14,color: kLightGreyColor2,),
            Spacer(),
            CustomText(text: detail,fontWeight: FontWeight.w400,fontSize: 12,color: kLightGreyColor2,),
            2.toHeight,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kWhiteColor,
                  boxShadow: [
                    BoxShadow(
                        color: kPrimaryColor.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 1)
                    )
                  ]
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 13.0.h,horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: value,fontWeight: FontWeight.w500,fontSize: 14),
                    CustomText(text: sign,fontWeight: FontWeight.w500,fontSize: 14),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideMenu(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeader("Vehicle Settings"),
                      24.toHeight,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: kCreamColor4
                          )
                        ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: "Manage commission rates and pricing for all vehicle types",fontWeight: FontWeight.w600,fontSize: 18,color: kLightGreyColor2,),
                                    CustomButton(text: "Edit Details", onTap: (){},width: 120,height: 40,fontSize: 14,)
                                  ],
                                ),
                                16.toHeight,
                                titleRow(kPercentIcon, "Commission Rates"),
                                16.toHeight,
                                Wrap(
                                  spacing: 13.w,
                                  runSpacing: 13.h,
                                  children: [
                                    feeContainer("Premium", "Commission Rate", "20", "%"),
                                    feeContainer("Plus", "Commission Rate", "20", "%"),
                                    feeContainer("Economy", "Commission Rate", "20", "%"),
                                    feeContainer("Black", "Commission Rate", "20", "%"),
                                    feeContainer("Black SUV", "Commission Rate", "20", "%"),
                                  ],
                                ),
                                16.toHeight,
                                titleRow(kPercentIcon, "Fare Per Mile",isDollar: true),
                                16.toHeight,
                                Wrap(
                                  spacing: 13.w,
                                  runSpacing: 13.h,
                                  children: [
                                    feeContainer("Premium", "Commission Rate", "20", "\$"),
                                    feeContainer("Plus", "Commission Rate", "20", "\$"),
                                    feeContainer("Economy", "Commission Rate", "20", "\$"),
                                    feeContainer("Black", "Commission Rate", "20", "\$"),
                                    feeContainer("Black SUV", "Commission Rate", "20", "\$"),
                                  ],
                                ),

                              ],
                            ),
                          )),
                      32.toHeight,

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
