import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xcore/const/app_assets.dart';
import '../const/app_colors.dart';
import '../data/data.dart';
import '../getx/battery_controller.dart';
import '../widgets/build_details.dart';

class CPUScreen extends StatefulWidget {
  const CPUScreen({super.key});

  @override
  State<CPUScreen> createState() => _CPUScreenState();
}

class _CPUScreenState extends State<CPUScreen> {
  List<VPNData> _chartData = [];

  @override
  void initState() {
    super.initState();
    _generateRandomData();
  }

  void _generateRandomData() {
    final List<VPNData> chartData = [];
    final random = Random();

    final List<String> points = [for (int i = 0; i < 50; i++) i.toString()];

    for (int i = 0; i < points.length; i++) {
      chartData.add(VPNData(
        yData: points[i],
        xData: random.nextDouble() * 160,
      ));
    }
    chartData.sort((a, b) => a.xData.compareTo(b.xData));
    setState(() {
      _chartData = chartData;
    });
  }

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
          "CPU Usage",
          style: TextStyle(
              color: AppColors.kSecondayColor, fontWeight: FontWeight.w500),
        ),
        toolbarHeight: 80,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.kPrimaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "CPU Usage",
                      style: TextStyle(
                          color: AppColors.kSecondayColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SfCartesianChart(
                      plotAreaBorderColor: Colors.transparent,
                      borderColor: Colors.transparent,
                      primaryXAxis: CategoryAxis(
                        isVisible: false, // Hide X-axis labels
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 160,
                        interval: 40,
                        majorGridLines: MajorGridLines(
                          width: 1,
                          color: AppColors.kBg2Color.withOpacity(.5),
                        ),
                        axisLine: AxisLine(color: Colors.transparent),
                        majorTickLines:
                            MajorTickLines(color: Colors.transparent),
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <SplineAreaSeries<VPNData, String>>[
                        SplineAreaSeries<VPNData, String>(
                          dataSource: _chartData,
                          xValueMapper: (VPNData sales, _) => sales.yData,
                          yValueMapper: (VPNData sales, _) => sales.xData,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.kMainColor.withOpacity(0.7),
                              AppColors.kMainColor.withOpacity(0.4),
                              AppColors.kMainColor.withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderColor: AppColors.kMainColor,
                          borderWidth: 2,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false),
                        )
                      ],
                    )
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
                      "Hardware of CPU",
                      style: TextStyle(
                          color: AppColors.kSecondayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 12),
                    Obx(() => buildDetails("Model", controller.sM.value)),
                    Obx(() => buildDetails("Brand", controller.samsung.value)),
                    Obx(() =>
                        buildDetails("Manufacturer", controller.finland.value)),
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
                      "CPU Status",
                      style: TextStyle(
                          color: AppColors.kSecondayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 12),
                    Obx(() => buildDetails("Cores 1", controller.core1.value)),
                    Obx(() => buildDetails("Cores 2", controller.core2.value)),
                    Obx(() => buildDetails("Cores 3", controller.core3.value)),
                    Obx(() => buildDetails("Cores 4", controller.core4.value)),
                    Obx(() => buildDetails("Cores 5", controller.core5.value)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
