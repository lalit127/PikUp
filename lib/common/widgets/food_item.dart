import 'package:pikup_app/common/common_import.dart';
import 'package:pikup_app/utils/base_extensions.dart';
import 'package:pikup_app/utils/base_fonts.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem(
      {super.key, required this.image, required this.title, this.onClick});

  final String image;
  final String title;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            )),
        7.0.toVSB,
        Text(
          title,
          style: TextStyle(
              fontFamily: BaseFonts.lexend,
              fontWeight: FontWeight.w400,
              fontSize: AppSizes.font_12,
              color: AppColors.secondaryColor),
        ),
      ],
    );
  }
}
