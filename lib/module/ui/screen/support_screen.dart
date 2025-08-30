import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_3/constant/app_constant.dart';
import 'package:task_3/constant/app_icon.dart';
import 'package:task_3/module/ui/widget/icon_app.dart';
import 'package:task_3/module/ui/widget/progressStepBar.dart';
import 'package:task_3/module/ui/widget/step_indicator_with_buttons.dart';
import 'package:task_3/module/ui/widget/support_tab.dart';
import 'package:task_3/module/viewmodels/support_viewmodel.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportController());
    return Scaffold(
      backgroundColor: const Color(0xFF2065A6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2065A6),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => controller.skipToEnd(),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text(AppConstants.skipButton),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => Progressstepbar(
                totalStep: controller.totalSteps,
                currentStep: controller.currentStep.value,
                completedColor: Colors.white,
                currentColor: const Color(0x55FFFFFF),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: IconApp(
              icon: AppIcon.support,
              title: AppConstants.supportTitle,
              description: AppConstants.supportDesc,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SupportTab(
                    title: controller.numberofcon[0].toString(),
                    subtitle: AppConstants.onlineConsultants,
                  ),
                  SupportTab(
                    title: controller.numberofcon[1],
                    subtitle: AppConstants.responseTime,
                  ),
                  SupportTab(
                    title:controller.numberofcon[2],
                    subtitle: controller.supportStatus[2],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => StepIndicatorWithButtons(
                onNext: controller.nextStep,
                onBack: controller.previousStep,
                totalSteps: controller.totalSteps,
                currentStep: controller.currentStep.value,
                activeColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}