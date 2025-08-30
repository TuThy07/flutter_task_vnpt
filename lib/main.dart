import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_3/route/app_routes.dart';
import 'package:task_3/route/app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppScreen.routes,
    );
  }
}
