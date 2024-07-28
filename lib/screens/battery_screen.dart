import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcore/const/app_assets.dart';
import 'package:xcore/const/app_colors.dart';
import '../getx/battery_controller.dart';
import '../widgets/build_details.dart';
import '../widgets/build_indicators.dart';
import '../widgets/performance.dart';

class BatteryScreen extends StatelessWidget {
  BatteryScreen({super.key});

  final BatteryController controller = Get.put(BatteryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 4),
          child:GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
            AppAssets.backIcon,
            height: 30,
            width: 30,
            color: AppColors.kSecondayColor,
          ),
        ),),
        title: Text(
          "Battery",
          style: TextStyle(
              color: AppColors.kSecondayColor, fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.kPrimaryColor,
              ),
              child: Row(
                children: [
                  Performance(
                    controller: controller,
                    performanceTxt: '${controller.batteryPercentage.value}%',
                  ),
                  SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => buildIndicators(AppAssets.battery,
                          "${controller.batteryPercentage.value}%")),
                      Obx(() => buildIndicators(
                          AppAssets.temp, "${controller.temperature.value}°C")),
                      Obx(() => buildIndicators(AppAssets.capacity,
                          "${controller.currentCapacity.value}mA")),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.kPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                        color: AppColors.kSecondayColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 12),
                  Obx(() =>
                      buildDetails("Technology", controller.technology.value)),
                  Obx(() => buildDetails(
                      "Temperature", controller.tempDetails.value)),
                  Obx(() => buildDetails("Current Capacity",
                      controller.currentCapacityDetails.value)),
                  Obx(() => buildDetails("Voltage", controller.voltage.value)),
                  Obx(() => buildDetails("Status", controller.status.value)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
