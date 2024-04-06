import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomNormalButton extends StatelessWidget {
  const CustomNormalButton({
    Key? key,
    required this.text,
    required this.padding,
    this.rightIcon,
    required this.onPressed,
    required this.buttoncolor,
    required this.textcolor,
    this.leftIcon,
    this.borderRadius,
    this.textStyle,
  }) : super(key: key);

  ///button text
  final String text;

  ///button text
  final TextStyle? textStyle;

  ///button right icon conditional
  final EdgeInsets padding;

  ///background color for normal button
  final Color buttoncolor;

  ///text color for normal button
  final Color textcolor;

  ///on pressed function
  final VoidCallback onPressed;

  ///button right icon conditional
  final Widget? rightIcon;

  ///button left icon conditional
  final Widget? leftIcon;

  ///button left icon conditional
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        borderRadius != null ? borderRadius! : 0.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom().copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(buttoncolor),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding,
          child: ClipRRect(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leftIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: AppSizes.mp_w_2 * 0.8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: leftIcon!,
                        ),
                      )
                    : const SizedBox(),
                Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ??
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: textcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.font_12,
                          ),
                ),
                rightIcon != null
                    ? Padding(
                        padding: EdgeInsets.only(left: AppSizes.mp_w_6 / 2),
                        child: rightIcon!,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNormalButtonBorder extends StatelessWidget {
  const CustomNormalButtonBorder({
    Key? key,
    required this.text,
    required this.padding,
    this.rightIcon,
    required this.onPressed,
    required this.buttoncolor,
    required this.textcolor,
    this.leftIcon,
    this.borderRadius,
    this.textStyle,
  }) : super(key: key);

  ///button text
  final String text;

  ///button text
  final TextStyle? textStyle;

  ///button right icon conditional
  final EdgeInsets padding;

  ///background color for normal button
  final Color buttoncolor;

  ///text color for normal button
  final Color textcolor;

  ///on pressed function
  final VoidCallback onPressed;

  ///button right icon conditional
  final Widget? rightIcon;

  ///button left icon conditional
  final Widget? leftIcon;

  ///button left icon conditional
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: borderRadius == null
          ? ElevatedButton.styleFrom(
              side: BorderSide(width: 1.0, color: textcolor),
              backgroundColor: buttoncolor,
            )
          : ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      side: BorderSide(color: buttoncolor)))),
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: ClipRRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: AppSizes.mp_w_2 * 0.8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: leftIcon!,
                      ),
                    )
                  : const SizedBox(),
              Text(
                text,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: textcolor, fontWeight: FontWeight.w600),
              ),
              rightIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(left: AppSizes.mp_w_2 / 2),
                      child: rightIcon!,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNormalButton2 extends StatelessWidget {
  const CustomNormalButton2({
    Key? key,
    required this.text,
    required this.padding,
    this.leftIcon,
    required this.onPressed,
    required this.buttoncolor,
    required this.textcolor,
  }) : super(key: key);

  ///button text
  final String text;

  ///button right icon conditional
  final EdgeInsets padding;

  ///background color for normal button
  final Color buttoncolor;

  ///text color for normal button
  final Color textcolor;

  ///on pressed function
  final VoidCallback onPressed;

  ///button right icon conditional
  final Widget? leftIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom().copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(buttoncolor)),
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftIcon != null
                ? Padding(
                    padding: EdgeInsets.only(left: AppSizes.mp_w_2 / 2.5),
                    child: leftIcon!,
                  )
                : const SizedBox(),
            SizedBox(
              width: 1.w,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: textcolor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
