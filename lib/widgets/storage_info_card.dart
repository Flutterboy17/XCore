import 'package:flutter/material.dart';
import 'package:xcore/const/app_colors.dart';

class StorageInfoCard extends StatelessWidget {
  final String title;
  final String assetPath;
  final double progressValue;
  final String progressText;
  final String details;

  const StorageInfoCard({
    super.key,
    required this.title,
    required this.assetPath,
    required this.progressValue,
    required this.progressText,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kPrimaryColor,
      ),
      child: Row(
        children: [
          Image.asset(
            assetPath,
            height: 40,
            width: 40,
            color: AppColors.kMainColor,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.kSecondayColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(30),
                      backgroundColor: AppColors.kBg2Color,
                      value: progressValue,
                      minHeight: 10,
                      color: AppColors.kMainColor,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    progressText,
                    style: TextStyle(
                      color: AppColors.kSecondayColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Text(
                details,
                style: TextStyle(
                  color: AppColors.kSecondayColor.withOpacity(.5),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
