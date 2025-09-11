import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lyft_admin/custom_widgets/custom_dialouge.dart';
import 'package:lyft_admin/utils/app_images.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_header.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/ride_container.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/common_code.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/ride_controller.dart';

class RideScreen extends GetView<RideController> {
  RideScreen({super.key});

  rideDetail(){
    return CustomDialog(
      width: 550.w,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w,vertical: 13.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Ride Details",fontWeight: FontWeight.w500,fontSize: 24.sp,),
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
              29.toHeight,
              Container(
                height: 345.h,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(41.878113, -87.629799),
                      zoom: 12,
                    ),
                    onMapCreated: controller.setGlobalMap,
                  ),
                ),
              ),
              29.toHeight,
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
                  padding:  EdgeInsets.symmetric(vertical: 18.h,horizontal: 14.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(kCarImage,width: 124.w,height: 92.h,),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              spacing: 6.h,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(text: "Premium",fontWeight: FontWeight.w500,fontSize: 18),
                                CustomText(text: "\$100.5",fontWeight: FontWeight.w500,fontSize: 14),
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        endIndent: 0,
                        indent: 0,
                        color: kCreamColor3.withOpacity(0.7),
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                kMarkerIcon,
                                height: 24,
                                width: 24,
                              ),
                              Container(
                                height: 33,
                                width: 2,
                                color: kPrimaryColor,
                              ),
                              Image.asset(
                                kLocationIcon,
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                          12.toWidth,
                          Expanded(
                            child: SizedBox(
                              height: 80,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  locationTile(
                                    title: "Pickup location",
                                  ),
                                  locationTile(
                                    title: "Drop-off location",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          12.toWidth,
                          SizedBox(
                            height: 80,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                locationTile(
                                  title: "Train Station",
                                ),
                                locationTile(
                                  title: "Tampa Airport",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
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
                      customHeader("Rides"),
                      24.toHeight,

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
                                      "Booking ID",
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
                                      "Customer",
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
                                      "Driver",
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
                                      "Fare",
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
                                      "Status",
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
                                    user['id']!,
                                    user['customer']!,
                                    user['driver']!,
                                    user['fare']!,
                                    user['status']!,
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
    String id,
      String customer,
    String driver,
    String fare,
    String status,
    context,
  ) {
    return DataRow(
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              id,
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
            customer,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DataCell(
          Text(
            driver,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DataCell(
          Text(
            "\$$fare",
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle().copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        DataCell(
          Container(
            height: 32,
            width: 100,
            decoration: BoxDecoration(
                color: status == "Pending" ?
                kYellowColor.withValues(alpha: 0.17) :
                status == "Canceled" ?
                kRedColor.withValues(alpha: 0.17) : kGreenColor.withValues(alpha: 0.17),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text(
                status,
                textAlign: TextAlign.center,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: status == "Pending" ?
                  kYellowColor :
                  status == "Canceled" ?
                  kRedColor : kGreenColor,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                Get.dialog(rideDetail());
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
