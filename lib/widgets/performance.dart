import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:radial_progress/radial_progress.dart';
import 'package:xcore/getx/battery_controller.dart';
import '../const/app_colors.dart';

class Performance extends StatelessWidget {
  const Performance({
    super.key,
    required this.controller,
    required this.performanceTxt,
    this.performanceSubTxt,
  });

  final BatteryController controller;
  final String performanceTxt;
  final String? performanceSubTxt;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => RadialProgressWidget(
            percent: controller.batteryPercentage.value / 100,
            diameter: 120,
            bgLineColor: AppColors.kBg2Color,
            progressLineWidth: 16,
            startAngle: StartAngle.top,
            progressLineColors: [
              AppColors.kMainColor,
            ],
            centerChild: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  performanceTxt,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.kSecondayColor,
                  ),
                ),
                if (performanceSubTxt != null)
                  Text(
                    performanceSubTxt!,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.kSecondayColor.withOpacity(.6),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
