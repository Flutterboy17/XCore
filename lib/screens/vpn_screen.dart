import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xcore/const/app_assets.dart';
import 'package:xcore/const/app_colors.dart';
import 'package:xcore/const/app_sizes.dart';
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
          _buildCustomBackground(),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                _buildVPNButton(),
                SizedBox(height: AppSizes.sectionSpacing + 12),
                Obx(() => Text(
                      vpnController.connectionStatus.value,
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )),
                Obx(() => Text(
                      vpnController.timer.value,
                      style: TextStyle(
                        color: AppColors.kSecondaryColor.withOpacity(0.8),
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    )),
                SizedBox(height: AppSizes.sectionSpacing + 50),
                _buildLocationContainer(context),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildVPNButton() {
    return Stack(
                alignment: Alignment.center,
                children: [
                  _buildCircleAvatar(AppColors.kSecondaryColor, 115, 0.1),
                  _buildCircleAvatar(
                      AppColors.kSecondaryColor.withOpacity(0.8), 100, 0.2),
                  _buildCircleAvatarWithShadow(
                      AppColors.kSecondaryColor.withOpacity(0.8),
                      85,
                      0.3,
                      15,
                      30),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => GPUScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kSecondaryColor,
                        border: Border.all(
                            color: AppColors.kMainColor, width: 0.4),
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
                            AppColors.kSecondaryColor.withOpacity(0.6),
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
                              padding: const EdgeInsets.only(
                                  bottom: AppSizes.paddingVertical - 8),
                              child: Image.asset(
                                AppAssets.polygon,
                                height: 70,
                                width: 70,
                                color: AppColors.kMainColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppSizes.paddingVertical - 8),
                              child: Image.asset(
                                AppAssets.switchOn,
                                height: 20,
                                width: 20,
                                color: AppColors.kSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }

  ClipPath _buildCustomBackground() {
    return ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: AppSizes.cardHeight + 200,
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
                          color: AppColors.kSecondaryColor,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "VPN",
                        style: TextStyle(
                          color: AppColors.kSecondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
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
                          horizontal: AppSizes.paddingHorizontal - 4,
                          vertical: AppSizes.paddingVertical - 2),
                      decoration: BoxDecoration(
                        color: AppColors.kSecondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        AppAssets.logo,
                        height: 36,
                        width: 36,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      "XCore",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: AppColors.kSecondaryColor,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        );
  }

  Widget _buildCircleAvatar(Color color, double radius, double borderWidth) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: AppColors.kMainColor, width: borderWidth),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
      ),
    );
  }

  Widget _buildCircleAvatarWithShadow(Color color, double radius,
      double borderWidth, double spreadRadius, double blurRadius) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: AppColors.kMainColor, width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: AppColors.kMainColor.withOpacity(0.3),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
      ),
    );
  }

  Widget _buildLocationContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingVertical - 2,
        vertical: AppSizes.paddingVertical + 2,
      ),
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.kSecondaryColor,
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Your internet is now safe!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kMainColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.dropdown,
              height: 20,
              width: 20,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
