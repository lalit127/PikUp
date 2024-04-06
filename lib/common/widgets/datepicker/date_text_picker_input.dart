import 'package:pikup_app/common/common_import.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTextPickerInput extends StatefulWidget {
  const DateTextPickerInput({Key? key}) : super(key: key);

  @override
  State<DateTextPickerInput> createState() => _DateTextPickerInputState();
}

class _DateTextPickerInputState extends State<DateTextPickerInput> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  late FocusNode yearFocusNode;
  late FocusNode monthFocusNode;
  late FocusNode dayFocusNode;

  @override
  void initState() {
    super.initState();
    yearFocusNode = FocusNode();
    monthFocusNode = FocusNode();
    dayFocusNode = FocusNode();
  }

  @override
  void dispose() {
    yearController.dispose();
    monthController.dispose();
    dayController.dispose();
    yearFocusNode.dispose();
    monthFocusNode.dispose();
    dayFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.center,
            maxLength: 2,
            controller: dayController,
            keyboardType: TextInputType.number,
            focusNode: dayFocusNode,
            onChanged: (value) {
              if (value.length == 2) {
                FocusScope.of(context).requestFocus(monthFocusNode);
              }
            },
            style: AppTextStyles(context).bodyLargeBold.copyWith(
                  color: AppColors.blackLight,
                  fontSize: AppSizes.font_14,
                ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: AppSizes.mp_v_1 / 2,
                top: AppSizes.mp_v_1 / 2,
              ),
              hintText: "DD",
              counterText: '',
              hintStyle: AppTextStyles(context).bodyLargeBold.copyWith(
                    color: AppColors.grayLighter,
                    fontSize: AppSizes.font_14,
                  ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: AppSizes.icon_size_10,
                maxHeight: AppSizes.icon_size_10,
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: AppSizes.icon_size_10,
                maxHeight: AppSizes.icon_size_10,
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black,
                ),
              ),
            ),
            cursorColor: AppColors.primary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_2),
          child: SvgPicture.asset(
            Assets.icons.alarmsvg,
            color: AppColors.grayLight,
            height: AppSizes.icon_size_6,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: monthController,
            maxLength: 2,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            focusNode: monthFocusNode,
            onChanged: (value) {
              if (value.length == 2) {
                FocusScope.of(context).requestFocus(yearFocusNode);
              }
            },
            style: AppTextStyles(context).bodyLargeBold.copyWith(
                  color: AppColors.blackLight,
                  fontSize: AppSizes.font_14,
                ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: AppSizes.mp_v_1 / 2,
                top: AppSizes.mp_v_1 / 2,
              ),
              hintText: "MM",
              counterText: '',
              hintStyle: AppTextStyles(context).bodyLargeBold.copyWith(
                    color: AppColors.grayLighter,
                    fontSize: AppSizes.font_14,
                  ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: AppSizes.icon_size_10,
                maxHeight: AppSizes.icon_size_10,
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: AppSizes.icon_size_10,
                maxHeight: AppSizes.icon_size_10,
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black,
                ),
              ),
            ),
            cursorColor: AppColors.primary,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_2),
          child: SvgPicture.asset(
            Assets.icons.alarmsvg,
            color: AppColors.grayLight,
            height: AppSizes.icon_size_6,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: yearController,
            maxLength: 4,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            focusNode: yearFocusNode,
            onChanged: (value) {
              if (value.length == 4) {}
            },
            style: AppTextStyles(context).bodyLargeBold.copyWith(
                  color: AppColors.blackLight,
                  fontSize: AppSizes.font_14,
                ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                bottom: AppSizes.mp_v_1 / 2,
                top: AppSizes.mp_v_1 / 2,
              ),
              hintText: "YYYY",
              counterText: '',
              hintStyle: AppTextStyles(context).bodyLargeBold.copyWith(
                    color: AppColors.grayLighter,
                    fontSize: AppSizes.font_14,
                  ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: AppSizes.icon_size_10,
                maxHeight: AppSizes.icon_size_10,
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: AppSizes.icon_size_10,
                maxHeight: AppSizes.icon_size_10,
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grayLight,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black,
                ),
              ),
            ),
            cursorColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
