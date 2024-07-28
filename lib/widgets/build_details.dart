import 'package:flutter/material.dart';
import '../const/app_colors.dart';

Padding buildDetails(String txt1, txt2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt1,
            style: TextStyle(
                color: AppColors.kSecondayColor,
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