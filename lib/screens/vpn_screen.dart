import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcore/const/app_assets.dart';
import 'package:xcore/const/app_colors.dart';
import '../getx/vpn_controller.dart';
import '../widgets/wave_clipper.dart';
import 'gpu_screen.dart';

class VPNScreen extends StatelessWidget {
  const VPNScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VPNController vpnController = Get.put(VPNController());

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
              clipper: WaveClipper(),
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.85,
                  color: AppColors.kMainColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 8, top: 34, right: 4),
                        child: Row(
                          children: [
                            GestureDetector(
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
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "VPN",
                              style: TextStyle(
                                  color: AppColors.kSecondayColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                                color: AppColors.kSecondayColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.asset(
                              AppAssets.logo,
                              height: 36,
                              width: 36,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "XCore",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: AppColors.kSecondayColor),
                          ),
                        ],
                      ),
                      Spacer(flex: 3),
                    ],
                  ))),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kSecondayColor,
                          border: Border.all(
                              color: AppColors.kMainColor, width: .1),
                        ),
                        child: CircleAvatar(
                          radius: 115,
                          backgroundColor: AppColors.kSecondayColor,
                        )),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kSecondayColor,
                        border:
                            Border.all(color: AppColors.kMainColor, width: .2),
                      ),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor:
                            AppColors.kSecondayColor.withOpacity(0.8),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kSecondayColor,
                        border:
                            Border.all(color: AppColors.kMainColor, width: .3),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kMainColor.withOpacity(0.3),
                            spreadRadius: 15,
                            blurRadius: 30,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 85,
                        backgroundColor:
                            AppColors.kSecondayColor.withOpacity(0.8),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => GPUScreen());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kSecondayColor,
                            border: Border.all(
                                color: AppColors.kMainColor, width: .4),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kMainColor.withOpacity(0.5),
                                spreadRadius: 15,
                                blurRadius: 30,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor:
                                AppColors.kSecondayColor.withOpacity(0.6),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.poly,
                                  height: 70,
                                  width: 70,
                                  color: AppColors.kMainColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Image.asset(
                                    AppAssets.polygon,
                                    height: 70,
                                    width: 70,
                                    color: AppColors.kMainColor,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Image.asset(
                                      AppAssets.switchOn,
                                      height: 20,
                                      width: 20,
                                      color: AppColors.kSecondayColor,
                                    ))
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Obx(() => Text(
                      vpnController.connectionStatus.value,
                      style: TextStyle(
                          color: AppColors.kSecondayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
                Obx(() => Text(
                      vpnController.timer.value,
                      style: TextStyle(
                          color: AppColors.kSecondayColor.withOpacity(.8),
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    )),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                      color: AppColors.kSecondayColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.kSecondayColor,
                          backgroundImage: AssetImage(AppAssets.flag),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "New York, USA",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Your internet is now safe!",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kMainColor,
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            AppAssets.dropdown,
                            height: 20,
                            width: 20,
                            color: AppColors.kPrimaryColor,
                          ))
                    ],
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
