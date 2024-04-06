import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/common/status_bar_color_controller.dart';
import 'package:pikup_app/utils/base_extensions.dart';
import 'package:pikup_app/utils/base_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommonInputTextField extends StatefulWidget {
  CommonInputTextField({
    Key? key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.hintToLabel = false,
    this.moreInstructions,
    required this.autofocus,
    this.errorText,
    this.focusNode,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.isFilled = false,
    this.prefixIcon,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final String hint;
  final bool hintToLabel;
  final bool isPassword;
  final bool autofocus;
  final TextEditingController controller;
  final List<String>? moreInstructions;
  String? errorText;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  final Widget? suffix;
  final Widget? prefix;
  final String? prefixIcon;
  final bool isFilled;
  final TextInputType inputType;

  final void Function(String)? onChanged; // Callback when the text changes

  @override
  State<CommonInputTextField> createState() => _TextInputLoginState();
}

class _TextInputLoginState extends State<CommonInputTextField> {
  RxBool _isFocused = false.obs;
  RxBool isPasswordVisible = false.obs; // Added property

  @override
  void initState() {
    super.initState();

    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    if (widget.focusNode!.hasFocus) {
      _isFocused.value = true;
    } else {
      _isFocused.value = false;
    }
  }

  @override
  void dispose() {
    widget.focusNode!.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatusBarColorController statusBarColorController =
        Get.put(StatusBarColorController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: TextFormField(
              expands: checkIsPassword() ? false : true,
              maxLines: checkIsPassword() ? 1 : null,
              textInputAction: TextInputAction.next,
              keyboardType: widget.inputType,
              cursorColor: AppColors.black,
              controller: widget.controller,
              autofocus: widget.autofocus ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              style: AppTextStyles(context).titleBold.copyWith(
                  fontSize: AppSizes.font_12,
                  fontFamily: BaseFonts.lexend,
                  fontWeight: FontWeight.w400,
                  color:
                      widget.errorText != null && widget.errorText!.isNotEmpty
                          ? AppColors.errorColor
                          : _isFocused.value
                              ? AppColors.black
                              : AppColors.uiColor),
              obscureText: checkIsPassword() ? !isPasswordVisible.value : false,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    bottom: AppSizes.mp_v_1 * 1,
                    top: AppSizes.mp_v_1 / 1,
                    left: AppSizes.mp_v_1 * 2),
                hintText: widget.hint,
                hintStyle: AppTextStyles(context).textFieldLabel.copyWith(
                    fontSize: AppSizes.font_12,
                    color:
                        widget.errorText != null && widget.errorText!.isNotEmpty
                            ? AppColors.errorColor
                            : _isFocused.value
                                ? AppColors.black
                                : AppColors.uiColor,
                    fontFamily: BaseFonts.lexend,
                    fontWeight: FontWeight.w400),
                suffixIcon: widget.suffix,
                prefixIcon: widget.prefix ??
                    (widget.prefixIcon != null
                        ? SvgPicture.asset(
                            widget.prefixIcon!,
                            color: widget.errorText != null &&
                                    widget.errorText!.isNotEmpty
                                ? AppColors.errorColor
                                : _isFocused.value
                                    ? AppColors.black
                                    : AppColors.uiColor,
                          ).toAllPadding(14)
                        : null),
                filled: widget.isFilled,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    color:
                        widget.errorText != null && widget.errorText!.isNotEmpty
                            ? AppColors.errorColor
                            : AppColors.uiColor,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    color:
                        widget.errorText != null && widget.errorText!.isNotEmpty
                            ? AppColors.errorColor
                            : AppColors.uiColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(
                    color:
                        widget.errorText != null && widget.errorText!.isNotEmpty
                            ? AppColors.errorColor
                            : AppColors.primaryColor,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: AppColors.errorColor,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value); // Call the onChanged callback
                }
              },
              onTap: () {
                if (widget.focusNode != null) {
                  // Request focus for the field
                  FocusScope.of(context).requestFocus(widget.focusNode);
                }
                // Request focus for the password field when tapping
              },
              focusNode: widget.focusNode,
            ),
          ),
          widget.errorText != null && widget.errorText!.isNotEmpty
              ? Text(
                  widget.errorText!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: BaseFonts.lexend,
                    color: AppColors.errorColor,
                    fontSize: AppSizes.font_10,
                  ),
                )
              : SizedBox.shrink(),
          checkIsPassword()
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: AppSizes.mp_v_1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        checkHasMoreInstructions()
                            ? buildMoreInstructions()
                            : const SizedBox(),
                        buildHideUnhideButton()
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  _isErrorTextEmpty() => (widget.errorText ?? "").isEmpty;

  bool checkIsPassword() {
    if (widget.isPassword) {
      return true;
    }
    return false;
  }

  bool checkHasMoreInstructions() {
    if (widget.moreInstructions != null) {
      return true;
    }
    return false;
  }

  buildMoreInstructions() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: AppSizes.mp_w_4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            widget.moreInstructions!.length,
            (index) => Text(
              widget.moreInstructions!.elementAt(index),
              style: AppTextStyles(context).captionRegular.copyWith(
                    color: AppColors.grayDefault,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  buildHideUnhideButton() {
    return MaterialButton(
      padding: EdgeInsets.only(
        left: AppSizes.mp_w_2,
        right: AppSizes.mp_w_1 / 2,
      ),
      onPressed: () {
        isPasswordVisible.value =
            !isPasswordVisible.value; // Toggle the visibility of the password
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SvgPicture.asset(
              isPasswordVisible.value
                  ? Assets.icons.alarmsvg
                  : Assets.icons.alarmsvg,
              // Use different icons based on the password visibility
              color: isPasswordVisible.value
                  ? AppColors.primary
                  : AppColors.grayLight,
              width: AppSizes.icon_size_6,
            ),
          ),
          SizedBox(
            width: AppSizes.mp_w_1,
          ),
          Flexible(
            child: Text(
              isPasswordVisible.value ? "Show" : "Hidden",
              // Change the text based on the password visibility
              style: AppTextStyles(context).captionBold.copyWith(
                    color: isPasswordVisible.value
                        ? AppColors.primary
                        : AppColors.grayLight,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
