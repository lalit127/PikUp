import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DialogCenterCommonWidget extends StatelessWidget {
  const DialogCenterCommonWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteOff,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius_20),
      ),
      child: SizedBox(
        width: 90.w,
        child: child,
      ),
    );
  }
}
