import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_3/constant/app_constant.dart';
import 'package:task_3/constant/app_icon.dart';
import 'package:task_3/module/ui/widget/icon_app.dart';
import 'package:task_3/module/ui/widget/progressStepBar.dart';
import 'package:task_3/module/ui/widget/service_item.dart';
import 'package:task_3/module/ui/widget/step_indicator_with_buttons.dart';
import 'package:task_3/module/viewmodels/service_store_viewmodel.dart';

class ServiceStoreScreen extends StatelessWidget {
  const ServiceStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceStoreController());

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
              icon: AppIcon.shopping,
              title: AppConstants.serviceTitle,
              description: AppConstants.serviceDesc,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.serviceNames.length,
                itemBuilder: (context, index) {
                  IconData serviceIcon;
                  switch (controller.serviceNames[index]) {
                    case AppConstants.vPSPrenium:
                      serviceIcon = AppIcon.prenium;
                      break;
                    case AppConstants.backUpPro:
                      serviceIcon = AppIcon.prenium;
                      break;
                    case AppConstants.sEOTools:
                      serviceIcon = AppIcon.star;
                      break;
                    default:
                      serviceIcon = AppIcon.star;
                  }
                  return TabService(
                    title: controller.serviceNames[index],
                    status: controller.serviceStatuses[0],
                    price: controller.servicePrices[index],
                    icon: serviceIcon,
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
                onBack: controller.previousStep,
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
