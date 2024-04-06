import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/config/theme/app_text_styles.dart';
import 'package:flutter/services.dart';

class ChatInputTextField extends StatefulWidget {
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

  const ChatInputTextField({
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
  State<ChatInputTextField> createState() => _ChatInputTextFieldState();
}

class _ChatInputTextFieldState extends State<ChatInputTextField> {
  final FocusNode _focusNode = FocusNode();
  Color? _iconColor = Colors.grey;
  double borderSize = 0;

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
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        counterText: "",
        hintText: widget.hintText,
        hintStyle:
            AppTextStyles(context).bodySmallRegular.copyWith(color: _iconColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 5,
          ),
          borderSide: BorderSide(
            width: borderSize,
            color: AppColors.backgroundLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.backgroundLight, width: 1.0),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          borderSide: BorderSide(
            color: AppColors.backgroundLight,
            width: borderSize,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 5),
          borderSide: BorderSide(
            color: AppColors.backgroundLight,
            width: borderSize,
          ),
        ),
        prefixIconColor: _iconColor,
        // Change color on focus
        suffixIconColor: _iconColor,
        // Change color on focus
        errorMaxLines: 2,
        filled: true,
        fillColor: AppColors.backgroundLight,
        suffixIcon: widget.isIcon ? widget.suffixIcon : null,
        prefixIcon: widget.isIcon ? widget.prefixIcon : null,
      ),
      cursorColor: AppColors.primary,
      cursorWidth: 2,
      minLines: 1,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
      validator: widget.validator!,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
    );
  }
}
