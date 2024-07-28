import 'package:flutter/material.dart';
import 'package:xcore/const/app_colors.dart';
import 'package:xcore/const/app_sizes.dart';

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
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical),
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
          SizedBox(width: AppSizes.sectionSpacing - 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: AppSizes.sectionSpacing - 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(30),
                        backgroundColor: AppColors.kBg2Color,
                        value: progressValue,
                        minHeight: 10,
                        color: AppColors.kMainColor,
                      ),
                    ),
                    SizedBox(width: AppSizes.sectionSpacing),
                    Text(
                      progressText,
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: AppSizes.sectionSpacing - 12),
                  ],
                ),
                SizedBox(height: AppSizes.sectionSpacing - 8),
                Text(
                  details,
                  style: TextStyle(
                    color: AppColors.kSecondaryColor.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
