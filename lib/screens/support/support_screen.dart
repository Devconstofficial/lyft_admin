import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lyft_admin/custom_widgets/custom_button.dart';
import 'package:lyft_admin/custom_widgets/delete_user.dart';
import 'package:lyft_admin/screens/support/controller/support_controller.dart';
import 'package:lyft_admin/utils/app_images.dart';
import 'package:lyft_admin/utils/sizedBox_extention.dart';
import '../../custom_widgets/custom_dialouge.dart';
import '../../custom_widgets/custom_header.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class SupportScreen extends GetView<SupportController> {
  const SupportScreen({super.key});

  Widget chatDialog() {
    return CustomDialog(
      width: 879.w,
      widget: SizedBox(
        height: 813.h,
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(kPersonImage),
                        radius: 24,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Johan", style: AppStyles.blackTextStyle().copyWith(fontWeight: FontWeight.w500, fontSize: 16.sp)),
                          Row(
                            children: [
                              Icon(Icons.circle, size: 8, color: kPrimaryColor),
                              SizedBox(width: 4),
                              Text("Online • 12:55 am", style: AppStyles.blackTextStyle().copyWith(fontSize: 12.sp, color: kPurpleColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Mark as solved", style: AppStyles.blackTextStyle().copyWith(color: kPrimaryColor)),
                  )
                ],
              ),
            ),
            Divider(height: 1, thickness: 1, color: kGreyColor5,indent: 0,endIndent: 0,),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final msg = controller.messages[index];
                      final isMe = msg.isUser;

                      // Date separator (you can improve with group logic later)
                      final bool showDate = index == 0 ||
                          msg.time.day != controller.messages[index - 1].time.day;

                      return Column(
                        crossAxisAlignment:
                        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          if (showDate)
                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: kGreyColor4,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  msg.time.day == DateTime.now().day ? 'Today' : '12 August 2025',
                                  style: AppStyles.blackTextStyle().copyWith(color: kDarkBlue),
                                ),
                              ),
                            ),
                          Align(
                            alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 4),
                              constraints: BoxConstraints(maxWidth: 500.w),
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: isMe ? kCreamColor5 : kPrimaryColor,
                                border: isMe
                                    ? Border.all(color: kCreamColor6, width: 0.5)
                                    : null,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(isMe ? 16 : 0),
                                  bottomRight: Radius.circular(isMe ? 0 : 16),
                                ),
                              ),
                              child: Text(
                                msg.text,
                                style: AppStyles.blackTextStyle().copyWith(
                                  color: isMe ? kDarkBlue : kWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
                            child: Row(
                              mainAxisAlignment:
                              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${msg.time.hour}:${msg.time.minute.toString().padLeft(2, '0')} am",
                                  style: AppStyles.blackTextStyle().copyWith(
                                      fontSize: 10.sp, color: Colors.grey),
                                ),
                                if (isMe) ...[
                                  SizedBox(width: 4),
                                  Icon(Icons.done_all, size: 14, color: Colors.grey),
                                ]
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),

              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kCreamColor7),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
                child: Row(
                  children: [
                    Container( height: 32, width: 32, decoration: BoxDecoration( borderRadius: BorderRadius.circular(8) ,color: kPrimaryColor), child: Icon(Icons.add,color: kWhiteColor,)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Obx(() => TextField(
                        onChanged: (val) => controller.currentMessage.value = val,
                        controller: TextEditingController.fromValue(
                          TextEditingValue(
                            text: controller.currentMessage.value,
                            selection: TextSelection.collapsed(
                                offset: controller.currentMessage.value.length),
                          ),
                        ),
                        decoration: InputDecoration(
                          hintText: "Your message",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),

                      )),
                    ),
                    SizedBox(width: 8.w),
                    CustomButton(
                      text: "Send",
                      onTap: () {
                        controller.sendMessage();
                        Future.delayed(Duration(milliseconds: 100), () {
                          controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent);
                        });
                      },
                      height: 36,
                      width: 100,
                      borderRadius: 6,
                      isImage: true,
                      image: kSendIcon,
                    )
                  ],
                ),
              ),
            ),
            
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
                      customHeader("Support"),
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
                                      "Issue Type",
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
                                      "Date",
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
                                    user['customer']!,
                                    user['driver']!,
                                        user['issue']!,
                                    user['date']!,
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
                color: status == "Active" ?
                kGreyColor1.withValues(alpha: 0.66) : kGreenColor.withValues(alpha: 0.17),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Text(
                status,
                textAlign: TextAlign.center,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: status == "Active" ?
                  kPrimaryColor : kGreenColor,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              height: 40,
              width: 125,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(deleteUser());
                        },
                        child: SvgPicture.asset(
                          kDeleteIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      color: kWhiteColor.withOpacity(0.5),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(chatDialog());
                        },
                        child: SvgPicture.asset(
                          kChatIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
