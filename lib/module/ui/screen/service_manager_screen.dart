import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_3/constant/app_constant.dart';
import 'package:task_3/constant/app_icon.dart';
import 'package:task_3/module/ui/widget/icon_app.dart';
import 'package:task_3/module/ui/widget/progressStepBar.dart';
import 'package:task_3/module/ui/widget/service_item.dart';
import 'package:task_3/module/ui/widget/step_indicator_with_buttons.dart';
import 'package:task_3/module/viewmodels/service_manager_viewmodel.dart';

class ServiceManagerScreen extends StatelessWidget {
  const ServiceManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceMangerController());

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
              icon: AppIcon.menu,
              title: AppConstants.serviceManagerTitle,
              description: AppConstants.serviceManagementDesc,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.serviceNames.length,
                itemBuilder: (context, index) {
                  return TabService(
                    title: controller.serviceNames[index],
                    status: controller.serviceStatuses[index],
                    price: controller.servicePrices[index],
                    // Biến 'icon' không được truyền vào nữa, chỉ giữ lại chấm
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => StepIndicatorWithButtons(
                onNext: controller.nextStep,
                totalSteps: controller.totalSteps,
                currentStep: controller.currentStep.value,
                activeColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}