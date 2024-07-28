import 'package:flutter/material.dart';
import '../const/app_colors.dart';

Padding buildIndicators(String buildIcon, buildTxt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            buildIcon,
            height: 25,
            width: 25,
            color: AppColors.kSecondayColor,
          ),
          SizedBox(width: 4),
          Text(
            buildTxt,
            style: TextStyle(
                color: AppColors.kSecondayColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }