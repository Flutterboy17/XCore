import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xcore/const/app_assets.dart';
import 'package:xcore/screens/battery_screen.dart';
import '../const/app_colors.dart';
import '../getx/battery_controller.dart';
import '../widgets/build_details.dart';
import '../widgets/performance.dart';

class GPUScreen extends StatefulWidget {
  const GPUScreen({super.key});

  @override
  State<GPUScreen> createState() => _GPUScreenState();
}

class _GPUScreenState extends State<GPUScreen> {
  final BatteryController controller = Get.put(BatteryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 4),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppAssets.backIcon,
              height: 30,
              width: 30,
              color: AppColors.kSecondayColor,
            ),
          ),
        ),
        title: Text(
          "GPU Usage",
          style: TextStyle(
              color: AppColors.kSecondayColor, fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              width: MediaQuery.of(context).size.width - 30,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.kPrimaryColor,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
                    child: Performance(
                      controller: controller,
                      performanceTxt: '${controller.batteryPercentage.value}%',
                      performanceSubTxt: "Usage",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SfCartesianChart(
                      primaryYAxis: NumericAxis(
                        isVisible: false,
                        majorGridLines: MajorGridLines(
                          width: 1,
                          color: AppColors.kBg2Color.withOpacity(.5),
                        ),
                        axisLine: AxisLine(color: Colors.transparent),
                        majorTickLines:
                            MajorTickLines(color: Colors.transparent),
                      ),
                      plotAreaBorderColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      primaryXAxis: CategoryAxis(
                        isVisible: false,
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      series: [
                        ColumnSeries<ChartData, String>(
                          dataSource: [
                            ChartData('Bar 1', 30),
                            ChartData('Bar 2', 50),
                            ChartData('Bar 3', 10),
                            ChartData('Bar 4', 15),
                            ChartData('Bar 5', 25),
                          ],
                          width: .5,
                          color: AppColors.kMainColor,
                          pointColorMapper: (ChartData data, _) => data.y == 50
                              ? AppColors.kMainColor
                              : AppColors.kBg2Color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Get.to(BatteryScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                width: MediaQuery.of(context).size.width - 30,
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
                    Obx(() => buildDetails(
                        "Utilization", controller.utilization.value)),
                    Obx(() => buildDetails(
                        "Current frequency", controller.cfrequency.value)),
                    Obx(() => buildDetails(
                        "Max frequency", controller.mfrequency.value)),
                    Obx(() =>
                        buildDetails("Temperature", controller.temp.value)),
                    Obx(() => buildDetails(
                        "Available memory", controller.memory.value)),
                    Obx(() => buildDetails("Status", controller.gStatus.value)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
