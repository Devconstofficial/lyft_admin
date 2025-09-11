import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/custom_widgets/custom_textfield.dart';
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
import 'controller/user_controller.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

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
                      customHeader("Users"),
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
                Get.dialog(deleteUser());
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
                    child: SvgPicture.asset(
                      kDeleteIcon,
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
