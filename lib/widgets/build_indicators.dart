import 'package:flutter/material.dart';
import 'package:xcore/const/app_sizes.dart';
import '../const/app_colors.dart';

Padding buildIndicators(String buildIcon, buildTxt) {
  return Padding(
     padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingVertical-8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          buildIcon,
          height: 25,
          width: 25,
          color: AppColors.kSecondaryColor,
        ),
        SizedBox(width: AppSizes.sectionSpacing-12),
        Text(
          buildTxt,
          style: TextStyle(
              color: AppColors.kSecondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
