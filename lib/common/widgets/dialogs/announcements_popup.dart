// ignore_for_file: library_private_types_in_public_api

import 'package:pikup_app/common/widgets/dialogs/dialog_center_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:pikup_app/common/common_import.dart';
import 'package:sizer/sizer.dart';

import '../custom_normal_button.dart';

class AnnouncementsPopup extends StatefulWidget {
  const AnnouncementsPopup({Key? key}) : super(key: key);

  @override
  _AnnouncementsPopupState createState() => _AnnouncementsPopupState();
}

class _AnnouncementsPopupState extends State<AnnouncementsPopup> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isSliderChanged = false;

  final List<Widget> _pages = [
    AnnouncementsPage(
      imagePath: Assets.images.imgSentEmail.path,
      text2:
          'We are conducting a new update of 9.7.5 that came with cherry blossoms that are pretty even if they fall. \nThe announcement will beincluded. Please enter at intervals between the lines.',
    ),
    const AnnouncementsPage(
      imagePath: "",
      text2:
          'We are conducting a new update of 9.7.5 that came with cherry blossoms that are pretty even if they fall. \nThe announcement will beincluded. Please enter at intervals between the lines.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DialogCenterCommonWidget(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.mp_w_6),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors
                    .dangerLight, // Replace with your desired background color
                borderRadius: BorderRadius.circular(
                    20), // Replace with your desired border radius
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Important',
                  textAlign: TextAlign.left,
                  style: AppTextStyles(context).display15W500.copyWith(
                        color: AppColors.danger,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: AppSizes.mp_v_1,
            ),
            Text(
              'Policy guidance following the lifting of CO...',
              style: AppTextStyles(context).display15W500,
            ),
            SizedBox(
              height: AppSizes.mp_v_1,
            ),
            Text(
              '(Sat)16-12-22',
              style: AppTextStyles(context).display15W500.copyWith(
                    color: AppColors.grayLight,
                  ),
            ),
            SizedBox(
              height: AppSizes.mp_v_1,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                    _isSliderChanged = index == _pages.length - 1;
                  });
                },
                children: _pages,
              ),
            ),
            SizedBox(
              height: AppSizes.mp_v_1,
            ),
            buildIndicator(),
            SizedBox(
              height: AppSizes.mp_v_4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNormalButton(
                  text: 'More',
                  textStyle: AppTextStyles(context).display15W500.copyWith(
                        color: AppColors.whiteOff,
                      ),
                  textcolor: AppColors.whiteOff,
                  buttoncolor: AppColors.blackLight,
                  borderRadius: AppSizes.radius_8,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.mp_v_2,
                    horizontal: AppSizes.mp_w_6,
                  ),
                  onPressed: () async {},
                ),
                SizedBox(
                  width: AppSizes.mp_v_1,
                ),
                CustomNormalButton(
                  text: 'Confirm',
                  textStyle: AppTextStyles(context).display15W500.copyWith(
                        color: AppColors.whiteOff,
                      ),
                  textcolor: AppColors.whiteOff,
                  buttoncolor: _isSliderChanged
                      ? AppColors.primary
                      : AppColors.grayLighter,
                  borderRadius: AppSizes.radius_8,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.mp_v_2,
                    horizontal: AppSizes.mp_w_2,
                  ),
                  onPressed: () async {},
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.mp_v_2 * 1.4,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentPage == index ? AppColors.primary : AppColors.grayLight,
          ),
        ),
      ),
    );
  }
}

class AnnouncementsPage extends StatelessWidget {
  final String? imagePath;

  final String text2;

  const AnnouncementsPage({
    Key? key,
    this.imagePath,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          imagePath != ""
              ? Container(
                  width: 100.w,
                  height: 13.h,
                  color: AppColors
                      .primaryLighter, // Replace with your desired color
                  child: Center(
                      child: Image.asset(
                    imagePath!,
                    fit: BoxFit.contain,
                  )),
                )
              : const SizedBox(),
          Text(
            text2,
            textAlign: TextAlign.start,
            style: AppTextStyles(context)
                .display15W500
                .copyWith(color: AppColors.grayDark),
          )
        ],
      ),
    );
  }
}
