import 'package:get/get.dart';
import 'package:task_3/constant/app_constant.dart';

import 'package:task_3/route/app_routes.dart';

class SupportController extends GetxController {
  var currentStep = 2.obs;
  final int totalSteps = 3;

  var currentPage = 0.obs;
  var totalPages = 3.obs;

  var numberofcon = <String>[].obs;
  var supportStatus = <String>[].obs;

  void nextStep() {
    if (currentStep.value < totalSteps) {
      currentStep.value++;
      _navigateToStep(currentStep.value);
    }
  }

  void previousStep() {
    if (currentStep.value > 1) {
      currentStep.value--;
      _navigateToStep(currentStep.value);
    }
  }

  void _navigateToStep(int step) {
    switch (step) {
      case 1:
        Get.offAndToNamed(AppRoutes.serviceManager);
        break;
      case 2:
        Get.offAndToNamed(AppRoutes.support);
        break;
      case 3:
        Get.offAndToNamed(AppRoutes.store);
        break;
    }
  }

  void skipToEnd() {
    Get.toNamed(AppRoutes.store);
  }

  void nextPage() {
    if (currentPage.value < totalPages.value - 1) {
      currentPage.value++;
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void goToPage(int index) {
    if (index >= 0 && index < totalPages.value) {
      currentPage.value = index;
    }
  }
@override
  void onInit() {
    super.onInit();
    initializeServices();
  }

  void initializeServices() {
    numberofcon.value = [
      AppConstants.numberOfOnlineConsultants.toString(),
      AppConstants.minutes,
      AppConstants.percent,
    ];

    supportStatus.value = [
      AppConstants.onlineConsultants,
      AppConstants.responseTime,
      AppConstants.satisfactionRate,
    ];
  }
}
