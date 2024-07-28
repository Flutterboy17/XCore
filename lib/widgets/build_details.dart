import 'package:flutter/material.dart';
import '../const/app_colors.dart';
import '../const/app_sizes.dart';

Padding buildDetails(String txt1, txt2) {
  return Padding(
    padding:
        const EdgeInsets.symmetric(vertical: AppSizes.paddingVertical - 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt1,
          style: TextStyle(
              color: AppColors.kSecondaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 15),
        ),
        Text(
          txt2,
          style: TextStyle(
              color: AppColors.kMainColor,
              fontWeight: FontWeight.normal,
              fontSize: 15),
        ),
      ],
    ),
  );
}
