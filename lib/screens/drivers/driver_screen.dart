import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/custom_widgets/custom_textfield.dart';
import 'package:lyft_admin/custom_widgets/ride_container.dart';
import 'package:lyft_admin/utils/app_images.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_dialouge.dart';
import '../../custom_widgets/custom_header.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/insight_container.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/driver_controller.dart';

class DriverScreen extends GetView<DriverController> {
  const DriverScreen({super.key});

  driverDetails(){
    return CustomDialog(
        width: 470,
        widget: Obx(() => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Driver Details",fontWeight: FontWeight.w500,fontSize: 24.sp,),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  color: kPrimaryColor.withOpacity(0.25)
                              )
                            ]
                        ),
                        child: Center(child: Icon(Icons.close,size: 14,)),
                      ),
                    ),
                  )
                ],
              ),
              20.toHeight,
              Obx(() => Row(
                spacing: 16.w,
                children: [
                  CustomButton(
                    text: "General",
                    onTap: () => controller.selectedTab.value = 0,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    width: 69,
                    height: 21,
                    borderRadius: 6,
                    borderColor: controller.selectedTab.value == 0 ? kPrimaryColor : kWhiteColor,
                    color: controller.selectedTab.value == 0 ? kPrimaryColor : kWhiteColor,
                    textColor: controller.selectedTab.value == 0 ? kWhiteColor : kPrimaryColor,
                  ),
                  CustomButton(
                    text: "Vehicle",
                    onTap: () => controller.selectedTab.value = 1,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    width: 61,
                    height: 24,
                    borderRadius: 6,
                    borderColor: controller.selectedTab.value == 1 ? kPrimaryColor : kWhiteColor,

                    color: controller.selectedTab.value == 1 ? kPrimaryColor : kWhiteColor,
                    textColor: controller.selectedTab.value == 1 ? kWhiteColor : kPrimaryColor,
                  ),
                  CustomButton(
                    text: "Total Earning",
                    onTap: () => controller.selectedTab.value = 2,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    width: 100,
                    height: 24,
                    borderRadius: 6,
                    borderColor: controller.selectedTab.value == 2 ? kPrimaryColor : kWhiteColor,

                    color: controller.selectedTab.value == 2 ? kPrimaryColor : kWhiteColor,
                    textColor: controller.selectedTab.value == 2 ? kWhiteColor : kPrimaryColor,
                  ),
                ],
              )),

              16.toHeight,
              if(controller.selectedTab.value == 0) ...[
                Row(
                  spacing: 16.h,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(kPersonImage,height: 90,width: 90,)),
                    Column(
                      spacing: 8.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Johan",fontWeight: FontWeight.w500,fontSize: 24,),
                        CustomText(text: "johan@gmail.com",fontWeight: FontWeight.w400,fontSize: 16,color: kLightGreyColor1,),
                        CustomText(text: "19130625925",fontWeight: FontWeight.w400,fontSize: 16,color: kLightGreyColor1,),
                      ],
                    )
                  ],
                ),
                18.toHeight,
                CustomText(text: "Rides",fontWeight: FontWeight.w500,fontSize: 14),
                16.toHeight,
                Row(
                  spacing: 10.w,
                  children: [
                    Expanded(
                      child: insightContainer(
                        kCarIcon,
                        "Completed Rides",
                        "10",
                      ),
                    ),
                    Expanded(
                      child: insightContainer(
                        kCarIcon,
                        "Cancelled Rides",
                        "3",
                      ),
                    ),
                  ],
                )
               ],
              if(controller.selectedTab.value == 1) ...[
                Container(
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 17.0.h,horizontal: 7.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(kCarImage,width: 124.w,height: 92.h,),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            spacing: 6.h,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomText(text: "Black SUV",fontWeight: FontWeight.w500,fontSize: 18,),
                              CustomText(text: "12-2-2029",fontWeight: FontWeight.w500,fontSize: 14,color: kLightGreyColor1,),
                              CustomText(text: "34907",fontWeight: FontWeight.w500,fontSize: 14,color: kLightGreyColor1,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                21.toHeight,
                Row(
                  spacing: 39.w,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 7.h,
                        children: [
                          CustomText(text: "License – Front Side",fontSize: 15,fontWeight: FontWeight.w500,color: kBlackColor,),
                          SizedBox(
                              height: 132.h,
                              child: Image.asset(kIdCardImage,fit: BoxFit.cover,))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 7.h,
                        children: [
                          CustomText(text: "License – Front Side",fontSize: 15,fontWeight: FontWeight.w500,color: kBlackColor,),
                          SizedBox(
                              height: 132.h,
                              child: Image.asset(kIdCardImage,fit: BoxFit.cover,))
                        ],
                      ),
                    ),
                  ],
                ),
                23.toHeight,
                Row(
                  spacing: 39.w,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6.h,
                        children: [
                          CustomText(text: "ID Card – Front Side",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
                          SizedBox(
                              height: 100.h,
                              child: Image.asset(kIdCardImage,fit: BoxFit.cover,))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6.h,
                        children: [
                          CustomText(text: "ID Card – Back Side",fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor,),
                          SizedBox(
                              height: 100.h,
                              child: Image.asset(kIdCardImage,fit: BoxFit.cover,))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              if(controller.selectedTab.value == 2) ...[
                Center(child: CustomText(text: "\$ 535.00",fontWeight: FontWeight.w400,fontSize: 35,)),
                16.toHeight,
                rideContainer("100.5", "26 number stop", "Manchester club, sadar ", "loc3"),
                16.toHeight,
                rideContainer("100.5", "26 number stop", "Manchester club, sadar ", "loc3"),
              ],
              21.toHeight,
              CustomButton(text: "Delete Driver", onTap: (){
                Get.back();
              },height: 62.h,fontWeight: FontWeight.w500,fontSize: 18.sp,),
            ],
          ),
        ),));
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
                      customHeader("Drivers"),
                      24.toHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 347.w,
                              child: CustomTextField(fieldController: controller.searchController, hintText: "Search here",prefixImage: kSearchIcon,))
                        ],
                      ),
                      32.toHeight,
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.25),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              spreadRadius: 0,
                            )
                          ]
                        ),
                        child: Obx(() => Stack(
                          children: [
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: kCreamColor1,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12)
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width,
                              child: DataTable(
                                columnSpacing: 0,
                                headingRowHeight: 80,
                                dataRowMinHeight: 90,
                                dataRowMaxHeight: 90,
                                dividerThickness: 0.1,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      "Name",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),

                                  DataColumn(
                                    label: Text(
                                      "Email",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Phone Number",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    headingRowAlignment: MainAxisAlignment.center,
                                    label: Text(
                                      "Action",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppStyles.blackTextStyle()
                                          .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),

                                ],
                                rows:
                                controller.pagedUsers
                                    .map(
                                      (user) => _buildDataRow(
                                    user['name']!,
                                    user['email']!,
                                    user['number']!,
                                    context,
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),),
                      ),
                      88.toHeight,
                      Obx(() => CustomPagination(
                        currentPage: controller.currentPage1.value,
                        visiblePages: controller.visiblePageNumbers,
                        onPrevious: controller.goToPreviousPage,
                        onNext: controller.goToNextPage,
                        onPageSelected: controller.goToPage,
                      )),
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

  DataRow _buildDataRow(
    String name,
      String email,
    String number,
    context,
  ) {
    return DataRow(
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        DataCell(
          Text(
            email,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DataCell(
          Text(
            number,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                Get.dialog(driverDetails());
              },
              child: Center(
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Image.asset(
                      kEyeIcon,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
