import 'package:pikup_app/common/common_import.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool? isEnabled;
  final bool isEnabledDigit;
  final bool isObscureText;
  final bool isIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final Function()? onChangeSuffixIcon;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final Color? enabledColor;
  final Color? disabledColor;
  final TextStyle? textStyle;
  final bool? isAutofocus;

  const AppTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.validator,
    this.isEnabled,
    this.isObscureText = false,
    required this.isEnabledDigit,
    this.maxLength,
    this.maxLines,
    this.onChange,
    this.onChangeSuffixIcon,
    this.isIcon = false,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.borderRadius,
    this.enabledColor,
    this.disabledColor,
    this.textStyle,
    this.isAutofocus,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  Color? _iconColor = Colors.grey;
  double borderSize = 2;

  @override
  void initState() {
    super.initState();
    _iconColor = Colors.grey;
    _focusNode.addListener(() {
      setState(() {
        _iconColor =
            _focusNode.hasFocus ? AppColors.grayLight : AppColors.grayLight;
      });
    });
    widget.textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.textEditingController.text.length));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.isEnabled,
      autofocus: widget.isAutofocus!,
      controller: widget.textEditingController,
      keyboardType: !widget.isObscureText
          ? widget.isEnabledDigit
              ? TextInputType.phone
              : TextInputType.text
          : TextInputType.visiblePassword,
      inputFormatters: <TextInputFormatter>[
        widget.isEnabledDigit
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        hintStyle:
            AppTextStyles(context).display15W500.copyWith(color: _iconColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          borderSide: BorderSide(width: borderSize),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          borderSide: (widget.enabledColor != null)
              ? BorderSide(color: widget.enabledColor!, width: borderSize)
              : BorderSide(width: borderSize),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          borderSide: BorderSide(
              color: widget.disabledColor ?? AppColors.grayLight,
              width: borderSize),
        ),
        enabledBorder: (widget.enabledColor != null)
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 5,
                ),
                borderSide:
                    BorderSide(color: widget.enabledColor!, width: borderSize))
            : null,
        prefixIconColor: _iconColor,
        // Change color on focus
        suffixIconColor: _iconColor,
        // Change color on focus
        errorMaxLines: 2,
        filled: true,
        fillColor: AppColors.whiteOff,
        suffixIcon: widget.isIcon ? widget.suffixIcon : null,
        prefixIcon: widget.isIcon ? widget.prefixIcon : null,
      ),
      cursorColor: AppColors.primary,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
      validator: widget.validator!,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
    );
  }
}
