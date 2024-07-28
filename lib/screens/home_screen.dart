import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xcore/const/app_sizes.dart';
import '../const/app_assets.dart';
import '../const/app_colors.dart';
import '../data/data.dart';
import '../widgets/custom_radialprogress_widget.dart';
import '../widgets/storage_info_card.dart';
import 'vpn_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<VPNData> _chartData = [];
  List<VPNData> _gpuGreenData = [];
  List<VPNData> _gpuOrangeData = [];

  @override
  void initState() {
    super.initState();
    _generateRandomData();
    _generateGpuData();
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

  void _generateGpuData() {
    final List<VPNData> gpuGreenData = [];
    final List<VPNData> gpuOrangeData = [];
    final random = Random();

    final List<String> points = [for (int i = 0; i < 10; i++) i.toString()];

    double greenStep = -30 / points.length;
    for (int i = 0; i < points.length; i++) {
      gpuGreenData.add(VPNData(
        yData: points[i],
        xData: 60 - greenStep * i + (random.nextDouble() * 20 - 10),
      ));
    }

    double orangeStep = 5 / points.length;
    for (int i = 0; i < points.length; i++) {
      gpuOrangeData.add(VPNData(
        yData: points[i],
        xData: 120 - orangeStep * i + (random.nextDouble() * 30 - 5),
      ));
    }

    setState(() {
      _gpuGreenData = gpuGreenData;
      _gpuOrangeData = gpuOrangeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSizes.sectionSpacing - 4),
              _buildCpuUsageChart(),
              SizedBox(height: AppSizes.sectionSpacing),
              _buildGpuPerformanceChart(),
              SizedBox(height: AppSizes.sectionSpacing),
              _buildNetworkInformation(),
              SizedBox(height: AppSizes.sectionSpacing),
              _buildInforCards(),
              SizedBox(height: AppSizes.sectionSpacing),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
        child: GestureDetector(
          onTap: () {
            Get.to(() => VPNScreen());
          },
          child: CircleAvatar(
            backgroundColor: AppColors.kBg2Color,
            child: Image.asset(
              AppAssets.profile,
              color: AppColors.kSecondaryColor,
              height: 20,
              width: 20,
            ),
          ),
        ),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning",
            style: TextStyle(
                color: AppColors.kSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          Text(
            "Jenny Wilson",
            style: TextStyle(
                color: AppColors.kSecondaryColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Image.asset(
            AppAssets.notification,
          ),
        ),
      ],
      toolbarHeight: AppSizes.appBarHeight,
      surfaceTintColor: Colors.transparent,
    );
  }

  Widget _buildCpuUsageChart() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical),
      width: MediaQuery.of(context).size.width - 30,
      height: AppSizes.cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kPrimaryColor,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CPU Usage",
                style: TextStyle(
                    color: AppColors.kSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              SizedBox(height: AppSizes.sectionSpacing),
              Expanded(
                child: SfCartesianChart(
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
                    majorTickLines: MajorTickLines(color: Colors.transparent),
                    labelStyle: TextStyle(
                        color: AppColors.kSecondaryColor.withOpacity(.5)),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: [
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
                      dataLabelSettings: DataLabelSettings(isVisible: false),
                    )
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "36%",
                  style: TextStyle(
                    color: AppColors.kSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 36,
                  ),
                ),
                Text(
                  "CPU Usage ",
                  style: TextStyle(
                      color: AppColors.kSecondaryColor.withOpacity(.5),
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      height: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGpuPerformanceChart() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical),
      width: MediaQuery.of(context).size.width - 30,
      height: AppSizes.cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GPU Performance",
            style: TextStyle(
                color: AppColors.kSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          SizedBox(height: AppSizes.sectionSpacing),
          Expanded(
            child: SfCartesianChart(
              plotAreaBorderColor: Colors.transparent,
              borderColor: Colors.transparent,
              primaryXAxis: CategoryAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 160,
                interval: 40,
                labelStyle:
                    TextStyle(color: AppColors.kSecondaryColor.withOpacity(.5)),
                majorGridLines: MajorGridLines(
                  width: 1,
                  color: AppColors.kBg2Color.withOpacity(.5),
                ),
                axisLine: AxisLine(color: Colors.transparent),
                majorTickLines: MajorTickLines(color: Colors.transparent),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                SplineSeries<VPNData, String>(
                  dataSource: _gpuOrangeData,
                  xValueMapper: (VPNData sales, _) => sales.yData,
                  yValueMapper: (VPNData sales, _) => sales.xData,
                  color: Colors.green,
                  width: 2,
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                ),
                SplineSeries<VPNData, String>(
                  dataSource: _gpuGreenData,
                  xValueMapper: (VPNData sales, _) => sales.yData,
                  yValueMapper: (VPNData sales, _) => sales.xData,
                  color: Colors.orange,
                  width: 2,
                  dataLabelSettings: DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.kBase1Color,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Normal",
                    style: TextStyle(
                      color: AppColors.kSecondaryColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.kMainColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Above Normal",
                    style: TextStyle(
                      color: AppColors.kSecondaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkInformation() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingHorizontal,
          vertical: AppSizes.paddingVertical),
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
            "Network Information",
            style: TextStyle(
                color: AppColors.kSecondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          SizedBox(height: AppSizes.sectionSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "25.75 GB",
                    style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingHorizontal + 6,
                        vertical: AppSizes.paddingVertical - 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.kMainColor.withOpacity(.3)),
                    child: Center(
                      child: Text(
                        "Wifi",
                        style: TextStyle(
                            color: AppColors.kMainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSizes.sectionSpacing + 2),
                  Text(
                    "25.75 GB",
                    style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  SizedBox(height: AppSizes.sectionSpacing - 12),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingHorizontal + 6,
                        vertical: AppSizes.paddingVertical - 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.green.withOpacity(.3)),
                    child: Center(
                      child: Text(
                        "Mobile",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              CustomRadialProgressWidget(
                diameter: 120,
                strokeWidth: 15,
              ),
            ],
          ),
          SizedBox(height: AppSizes.sectionSpacing + 12),
          Container(
            height: AppSizes.cardHeight - 150,
            decoration: BoxDecoration(
                color: AppColors.kAlertColor.withOpacity(.2),
                border: Border.all(color: AppColors.kAlertColor),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: AppColors.kAlertColor,
                  child: Center(
                    child: Image.asset(
                      AppAssets.alert,
                      height: 40,
                      width: 40,
                      color: AppColors.kSecondaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alert!",
                      style: TextStyle(
                          color: AppColors.kSecondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                    Text(
                      "Your network isn't safe",
                      style: TextStyle(
                          color: AppColors.kSecondaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    ),
                    Text(
                      "Connect VPN",
                      style: TextStyle(
                          color: AppColors.kAlertColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.kAlertColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: AppSizes.sectionSpacing - 8),
        ],
      ),
    );
  }

  Widget _buildInforCards() {
    return Column(
      children: [
        StorageInfoCard(
          title: "Internal Storage",
          assetPath: AppAssets.internalStorage,
          progressValue: 0.20,
          progressText: "20%",
          details: "Free: 180.3 GB, Total: 224.5 GB",
        ),
        SizedBox(height: 12),
        StorageInfoCard(
          title: "External Storage",
          assetPath: AppAssets.externalstorage,
          progressValue: 0.49,
          progressText: "49%",
          details: "Free: 50.00 GB, Total: 64.00 GB",
        ),
        SizedBox(height: 12),
        StorageInfoCard(
          title: "Battery (Charging)",
          assetPath: AppAssets.charging,
          progressValue: 0.76,
          progressText: "76%",
          details: "Voltage: 3868mV, Temperature: 43°C",
        ),
      ],
    );
  }
}
