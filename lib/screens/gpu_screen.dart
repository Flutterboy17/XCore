import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xcore/const/app_assets.dart';
import 'package:xcore/const/app_sizes.dart';
import 'package:xcore/screens/battery_screen.dart';
import '../const/app_colors.dart';
import '../data/data.dart';
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
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children: [
            _buildPerformanceContainer(context),
            SizedBox(height: AppSizes.sectionSpacing),
            GestureDetector(
              onTap: () {
                Get.to(BatteryScreen());
              },
              child: _buildDetailsContainer(),
            ),
            SizedBox(height: AppSizes.sectionSpacing),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 4),
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
          color: AppColors.kSecondayColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      toolbarHeight: AppSizes.appBarHeight,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildPerformanceContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingHorizontal + 4),
      width: MediaQuery.of(context).size.width - 30,
      height: AppSizes.cardHeight - 90,
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
          SizedBox(width: AppSizes.sectionSpacing + 4),
          Expanded(
            child: SfCartesianChart(
              primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: AppColors.kBg2Color.withOpacity(.5),
                ),
                axisLine: AxisLine(color: Colors.transparent),
                majorTickLines: MajorTickLines(color: Colors.transparent),
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
                  pointColorMapper: (ChartData data, _) =>
                      data.y == 50 ? AppColors.kMainColor : AppColors.kBg2Color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingHorizontal),
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
              fontSize: 20,
            ),
          ),
          SizedBox(height: AppSizes.sectionSpacing - 4),
          Obx(() => buildDetails("Utilization", controller.utilization.value)),
          Obx(() =>
              buildDetails("Current frequency", controller.cfrequency.value)),
          Obx(() => buildDetails("Max frequency", controller.mfrequency.value)),
          Obx(() => buildDetails("Temperature", controller.temp.value)),
          Obx(() => buildDetails("Available memory", controller.memory.value)),
          Obx(() => buildDetails("Status", controller.gStatus.value)),
        ],
      ),
    );
  }
}
