import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final List<int> visiblePages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Function(int) onPageSelected;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.visiblePages,
    required this.onPrevious,
    required this.onNext,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPrevious,
          child: Container(
            height: 36,
            width: 77,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                      color: kBlackColor.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 1)
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_back_ios, size: 12,color: kBlackShade1Color,),
                SizedBox(width: 4,),
                Text("Back", style: AppStyles.blackTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: kBlackShade1Color)),
              ],
            ),
          ),
        ),

        const SizedBox(width: 6),

        ...visiblePages.map((page) {
          final isSelected = currentPage == page;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () => onPageSelected(page),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: isSelected ? kPrimaryColor : kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: kBlackColor.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 1)
                      )
                    ]
                ),
                child: Center(
                  child: Text(
                    page.toString(),
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? kWhiteColor : kBlackColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),

        const SizedBox(width: 18),

        GestureDetector(
          onTap: onNext,
          child: Container(
            height: 36,
            width: 77,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: kBlackColor.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 1)
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Next", style: AppStyles.blackTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: kBlackShade1Color)),
                SizedBox(width: 4,),
                Icon(Icons.arrow_forward_ios_outlined, size: 12,color: kBlackShade1Color,),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
