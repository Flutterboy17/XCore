import 'package:flutter/material.dart';
import 'package:radial_progress/radial_progress.dart';
import 'package:xcore/const/app_colors.dart';

class CustomRadialProgressWidget extends StatelessWidget {
  final double diameter;
  final double strokeWidth;

  const CustomRadialProgressWidget({
    super.key,
    required this.diameter,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        RadialProgressWidget(
          percent: .79,
          diameter: diameter,
          progressLineWidth: strokeWidth,
          bgLineColor: AppColors.kBg2Color,
          progressLineColors: [
            AppColors.kBg2Color,
          ],
        ),
        RadialProgressWidget(
          percent: .54,
          diameter: diameter,
          progressLineWidth: strokeWidth,
          bgLineColor: Colors.transparent,
          progressLineColors: [
            AppColors.kMainColor,
          ],
        ),
        RadialProgressWidget(
          percent: .18,
          diameter: diameter,
          progressLineWidth: strokeWidth,
          bgLineColor: Colors.transparent,
          progressLineColors: [
            AppColors.kBase1Color,
          ],
          startAngle: StartAngle.bottom,
          centerChild: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "64GB",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.kSecondayColor,
                    fontSize: 24),
              ),
              Text(
                "Total",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.kSecondayColor.withOpacity(.6),
                    fontSize: 16,
                    height: 1),
              )
            ],
          ),
        ),
      ],
    );
  }
}
