import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppCommonAnnotatedRegion extends StatelessWidget {
  const AppCommonAnnotatedRegion(
      {Key? key,
      required this.child,
      this.statusBarColor,
      this.statusBarIconBrightness})
      : super(key: key);

  final Widget child;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? AppColors.whiteOff,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
      ),
      child: child,
    );
  }
}
