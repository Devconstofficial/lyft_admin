import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';


class CustomTextField extends StatelessWidget{
  final TextEditingController fieldController;
  final String hintText;
  final TextInputType? keyboardType;
  final String? errorText;
  final Color? hintColor;
  final bool readOnly;
  final int? maxLines;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final String? prefixImage;
  final double? suffixSize;
  final double? prefixSize;
  final double? prefixPadding;
  final Color? prefixImgColor;
  final Color? borderColor;
  final Color? bgColor;
  final bool showPrefix;
  final bool showSuffix;
  final bool isObscure;
  final bool isObscureText;
  final VoidCallback? onToggleVisibility;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool showBorder;
  final bool showCharCounter;
  final Widget? suffixIcon;
  final VoidCallback? suffixOnPress;
  final Key? suffixIconKey;

     const CustomTextField({
    super.key,
    required this.fieldController,
    required this.hintText,
    this.errorText,

    this.readOnly = false,
    this.keyboardType,
    this.maxLines = 1,
    this.padding,
    this.prefixImage,
    this.suffixSize,
    this.prefixSize,
    this.bgColor,
    this.prefixPadding,
    this.borderColor,
    this.showPrefix = false,
    this.showSuffix = false,
    this.radius,
    this.onTap,
    this.onChanged,
    this.hintColor,
    this.maxLength,
    this.showBorder = true,
    this.prefixImgColor,
    this.isObscure = false,
    this.isObscureText = false,
    this.onToggleVisibility,
    this.showCharCounter = false,
    this.suffixIcon,
    this.suffixOnPress,
       this.suffixIconKey
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      child: TextField(
        cursorColor: kPrimaryColor,
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLines: maxLines,
        controller: fieldController,
        onChanged: onChanged,
        obscuringCharacter: '*',
        onTap: onTap,
        obscureText: isObscureText,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: bgColor ?? kBlackShade1Color.withOpacity(0.01),
          contentPadding: padding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 22.h),
          enabledBorder: showBorder
              ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10.r),
              borderSide:BorderSide(
                  color: borderColor ?? Colors.transparent,
                  width: 1.5
              )):OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          prefixIcon: prefixImage != null && prefixImage!.isNotEmpty
              ? Padding(
            padding: EdgeInsets.only(left: 16.0.w, right: prefixPadding ?? 3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  prefixImage ?? "",
                  width: prefixSize ?? 20.w, color: prefixImgColor,
                ),
              ],
            ),
          )
              : null,
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppStyles.blackTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w200,color: hintColor ?? kPrimaryColor.withOpacity(0.88)),
          errorText: errorText,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
          ),
          focusedErrorBorder: showBorder ?OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ): OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          focusedBorder: showBorder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 10.r),
              borderSide:BorderSide(
                  color: kPrimaryColor,
                  width: 1.5)): OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: BorderSide(
              color: borderColor ??kPrimaryColor,
            ),
          ),
        ),
        style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500,color: kBlackColor),
      ),
    );
  }
}

