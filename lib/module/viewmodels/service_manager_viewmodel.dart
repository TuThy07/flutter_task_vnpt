import 'package:get/get.dart';
import 'package:task_3/constant/app_constant.dart';
import 'package:task_3/route/app_routes.dart';

class ServiceMangerController extends GetxController {
  // Current step for progress bar (ServiceManager = step 1)
  var currentStep = 1.obs;
  final int totalSteps = 3;

  // Current page for progress dots (content navigation within screen)
  var currentPage = 0.obs;
  var totalPages = 3.obs;

  // Services data (static data for UI design)
  var serviceNames = <String>[].obs;
  var servicePrices = <String>[].obs;
  var serviceStatuses = <String>[].obs;

  // Step navigation methods (between screens)
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

  // Skip button navigation
  void skipToEnd() {
    Get.toNamed(AppRoutes.store);
  }

  // Page navigation methods (for progress dots)
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

  // Initialize services data (static data for UI design)
  void initializeServices() {
    serviceNames.value = [
      AppConstants.cloudHosting,
      AppConstants.emailMarketing,
      AppConstants.sslCertificate,
    ];

    servicePrices.value = [
      AppConstants.cloudHostingPrices,
      AppConstants.emailMarketingPrices,
      AppConstants.sslCertificatePrices,
    ];

    serviceStatuses.value = [
      AppConstants.active,
      AppConstants.active,
      AppConstants.pending,
    ];
  }
  
}
