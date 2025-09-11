import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

FToast fToast = FToast();

showToast(BuildContext context, {int duration = 3, String msg = ''}) {

  fToast.init(context);
  fToast.showToast(
    toastDuration: Duration(seconds: duration),
    gravity: ToastGravity.BOTTOM,
    child: Container(
      padding: const EdgeInsets.only(left: 13, top: 20, right: 5, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
        kWhiteColor, boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(2, 3),
        ),
      ],
      ),
      child: Row(
        children: [
          // Image.asset('assets/images/t_logo.png', height: 15),
          // const SizedBox(width: 13),
          Expanded(
            child: Text(
              msg,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


