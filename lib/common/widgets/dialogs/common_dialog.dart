import 'package:pikup_app/common/common_import.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonTitlePrimary;
  final String? buttonTitleSecondry;
  final bool? isSecondryVisible;
  final Function() onPress;

  const CommonDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonTitlePrimary,
    this.buttonTitleSecondry,
    this.isSecondryVisible,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius_20),
      ),
      child: SizedBox(
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles(context).bodyLargeBold,
              ),
              SizedBox(
                height: AppSizes.mp_v_2,
              ),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles(context)
                    .captionRegular
                    .copyWith(color: AppColors.grayDefault),
              ),
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Visibility(
                      visible: isSecondryVisible ?? false,
                      child: Expanded(
                        child: ButtonPrimaryFill(
                          isterms: true,
                          buttonSizeType: ButtonSizeType.MEDIUM,
                          isDisabled: false,
                          text: buttonTitleSecondry ?? "",
                          onTap: onPress,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isSecondryVisible ?? false,
                      child: SizedBox(
                        width: 4.w,
                      ),
                    ),
                    Expanded(
                      child: ButtonPrimaryFill(
                        isterms: false,
                        buttonSizeType: ButtonSizeType.MEDIUM,
                        isDisabled: false,
                        text: buttonTitlePrimary,
                        onTap: onPress,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.mp_v_2 * 1.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonWithRichTextDialog extends StatelessWidget {
  final String title;
  final String startTitle;
  final String ceneterTitle;
  final String endTitle;
  final String buttonTitlePrimary;
  final String? buttonTitleSecondry;
  final bool? isSecondryVisible;
  final Function() onPress;

  const CommonWithRichTextDialog({
    super.key,
    required this.title,
    required this.startTitle,
    required this.ceneterTitle,
    required this.endTitle,
    required this.buttonTitlePrimary,
    this.buttonTitleSecondry,
    this.isSecondryVisible,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius_20),
      ),
      child: SizedBox(
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles(context).bodyLargeBold,
              ),
              SizedBox(
                height: AppSizes.mp_v_2,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: startTitle,
                  style: AppTextStyles(context)
                      .captionRegular
                      .copyWith(color: AppColors.grayDefault),
                  children: <TextSpan>[
                    TextSpan(
                      text: ceneterTitle,
                      style: AppTextStyles(context)
                          .captionBold
                          .copyWith(color: AppColors.grayDefault),
                    ),
                    TextSpan(
                      text: endTitle,
                      style: AppTextStyles(context)
                          .captionRegular
                          .copyWith(color: AppColors.grayDefault),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.mp_v_4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    Visibility(
                      visible: isSecondryVisible ?? false,
                      child: Expanded(
                        child: ButtonPrimaryFill(
                          isterms: true,
                          buttonSizeType: ButtonSizeType.MEDIUM,
                          isDisabled: false,
                          text: buttonTitleSecondry ?? "",
                          onTap: onPress,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isSecondryVisible ?? false,
                      child: SizedBox(
                        width: 4.w,
                      ),
                    ),
                    Expanded(
                      child: ButtonPrimaryFill(
                        isterms: false,
                        buttonSizeType: ButtonSizeType.MEDIUM,
                        isDisabled: false,
                        text: buttonTitlePrimary,
                        onTap: onPress,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.mp_v_2 * 1.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
