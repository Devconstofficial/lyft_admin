import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedboxExtention on int {
  Widget get toHeight {
    return SizedBox(
      height: toDouble().h,
    );
  }

  Widget get toWidth => SizedBox(width: toDouble().w);

}