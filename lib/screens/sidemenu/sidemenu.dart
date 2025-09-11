import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_dialouge.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'controller/sidemenu_controller.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(SideMenuController());

  // logoutDialog() {
  //   return CustomDialog(
  //     widget: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 61),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Container(
  //             height: 80,
  //             width: 80,
  //             decoration: BoxDecoration(
  //               color: kPrimaryColor,
  //               borderRadius: BorderRadius.circular(100),
  //             ),
  //             child: Center(
  //               child: SvgPicture.asset(
  //                 kLogoutIcon,
  //                 height: 55,
  //                 width: 55,
  //                 color: kWhiteColor,
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 26.h),
  //           Text(
  //             "Are you sure to logout this app?",
  //             style: AppStyles.blackTextStyle().copyWith(
  //               fontSize: 24,
  //               fontWeight: FontWeight.w600,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //           SizedBox(height: 35.h),
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: CustomButton(
  //                   title: "Cancel",
  //                   onTap: () {
  //                     Get.back();
  //                   },
  //                   color: kGreyShade5Color.withOpacity(0.22),
  //                   borderColor: kGreyShade5Color.withOpacity(0.22),
  //                   textColor: kPrimaryColor,
  //                   textSize: 16,
  //                   fontWeight: FontWeight.w700,
  //                   height: 56.h,
  //                 ),
  //               ),
  //               SizedBox(width: 8.w),
  //               Expanded(
  //                 child: CustomButton(
  //                   title: "Yes Logout",
  //                   onTap: () {
  //                     Storage.logout();
  //                     Get.offAllNamed(kAuthScreenRoute);
  //                   },
  //                   textSize: 16,
  //                   color: kPrimaryColor,
  //                   fontWeight: FontWeight.w700,
  //                   height: 56.h,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: kPrimaryColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none
      ),
      width: 250.w,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 140.h,
              child: DrawerHeader(
                child: Column(
                  children: [
                    30.toHeight,
                    SizedBox(
                      height: 50.h,
                      width: 90.w,
                      child: Center(
                        child: Image.asset(
                          kLogoImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Divider(color:kWhiteColor.withOpacity(0.3),thickness: 2,),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(0);
                              Get.toNamed(kDashboardScreenRoute);
                            },
                            child: Container(
                              width: width,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    0
                                    ? kWhiteColor
                                    : kPrimaryColor,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 14.w,),
                                        Image.asset(
                                          kDashboardIcon,
                                          height: 24,
                                          width: 24,
                                          color:  menuController
                                              .selectedIndex
                                              .value ==
                                              0
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                        ),
                                        SizedBox(
                                          width:
                                              12.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Dashboard",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                                  color:
                                                      menuController
                                                                  .selectedIndex
                                                                  .value ==
                                                              0
                                                          ? kPrimaryColor
                                                          : kWhiteColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      16.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(1);
                              Get.toNamed(kUserScreenRoute);
                            },
                            child: Container(
                              width: width,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    1
                                    ? kWhiteColor
                                    : kPrimaryColor,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 14.w,),
                                        Image.asset(
                                          kUserIcon,
                                          height: 24,
                                          width: 24,
                                          color:  menuController
                                              .selectedIndex
                                              .value ==
                                              1
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                        ),
                                        SizedBox(
                                          width:
                                          12.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Users",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                              color:
                                              menuController
                                                  .selectedIndex
                                                  .value ==
                                                  1
                                                  ? kPrimaryColor
                                                  : kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      16.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(2);
                              Get.toNamed(kDriverScreenRoute);
                            },
                            child: Container(
                              width: width,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    2
                                    ? kWhiteColor
                                    : kPrimaryColor,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 14.w,),
                                        Image.asset(
                                          kDriverIcon,
                                          height: 24,
                                          width: 24,
                                          color:  menuController
                                              .selectedIndex
                                              .value ==
                                              2
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                        ),

                                        SizedBox(
                                          width:
                                          12.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Drivers",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                              color:
                                              menuController
                                                  .selectedIndex
                                                  .value ==
                                                  2
                                                  ? kPrimaryColor
                                                  : kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      16.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(3);
                              Get.toNamed(kRideScreenRoute);
                            },
                            child: Container(
                              width: width,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    3
                                    ? kWhiteColor
                                    : kPrimaryColor,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 14.w,),
                                        Image.asset(
                                          kCarIcon,
                                          height: 24,
                                          width: 24,
                                          color:  menuController
                                              .selectedIndex
                                              .value ==
                                              3
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                        ),
                                        SizedBox(
                                          width:
                                          12.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Rides",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                              color:
                                              menuController
                                                  .selectedIndex
                                                  .value ==
                                                  3
                                                  ? kPrimaryColor
                                                  : kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      16.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(4);
                              Get.toNamed(kVehicleSettingsScreenRoute);
                            },
                            child: Container(
                              width: width,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    4
                                    ? kWhiteColor
                                    : kPrimaryColor,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 14.w,),
                                        Image.asset(
                                          kSettingsIcon,
                                          height: 24,
                                          width: 24,
                                          color:  menuController
                                              .selectedIndex
                                              .value ==
                                              4
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                        ),
                                        SizedBox(
                                          width:
                                          12.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Vehicle Settings",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                              color:
                                              menuController
                                                  .selectedIndex
                                                  .value ==
                                                  4
                                                  ? kPrimaryColor
                                                  : kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      16.toHeight,
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(5);
                              Get.toNamed(kSupportScreenRoute);
                            },
                            child: Container(
                              width: width,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: menuController
                                    .selectedIndex
                                    .value ==
                                    5
                                    ? kWhiteColor
                                    : kPrimaryColor,
                              ),

                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 16.h,
                                          width: 3.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(width: 14.w,),
                                        Image.asset(
                                          kSupportIcon,
                                          height: 24,
                                          width: 24,
                                          color:  menuController
                                              .selectedIndex
                                              .value ==
                                              5
                                              ? kPrimaryColor
                                              : kWhiteColor,
                                        ),
                                        SizedBox(
                                          width:
                                          12.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Support",
                                            style: AppStyles.blackTextStyle()
                                                .copyWith(
                                              color:
                                              menuController
                                                  .selectedIndex
                                                  .value ==
                                                  5
                                                  ? kPrimaryColor
                                                  : kWhiteColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0, left: 42),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(kAuthScreenRoute);
                    // Get.dialog(logoutDialog());
                  },
                  child: Container(
                    width: width,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kPrimaryColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 16.h,
                                width: 4.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: kPrimaryColor,
                                ),
                              ),
                              SizedBox(width: 14.w,),
                              Image.asset(
                                kLogoutIcon,
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(
                                width:
                                12.w,
                              ),
                              Text(
                                "Logout",
                                style: AppStyles.whiteTextStyle()
                                    .copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
