import 'package:get/get.dart';
import 'package:task_3/module/ui/screen/service_manager_screen.dart';
import 'package:task_3/module/ui/screen/service_store_screen.dart';
import 'package:task_3/module/ui/screen/support_screen.dart';
import 'package:task_3/route/app_routes.dart';

class AppScreen {
  static final routes = [
    GetPage(name: AppRoutes.serviceManager, page: () => ServiceManagerScreen()),
    GetPage(name: AppRoutes.support, page: () => SupportScreen()),
    GetPage(name: AppRoutes.store, page: () => ServiceStoreScreen()),
  ];
}
