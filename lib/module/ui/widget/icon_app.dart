import 'package:flutter/material.dart';
import 'package:task_3/constant/app_constant.dart';
import 'package:task_3/constant/app_textstyle.dart';

class IconApp extends StatelessWidget {
  final IconData icon;
  final double size1;
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final String description;

  const IconApp({
    super.key,
    required this.icon,
    this.size1 = 28,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.grey,
    this.title = AppConstants.serviceManagerTitle,
    this.description = AppConstants.serviceManagementDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(51, 255, 255, 255),
          radius: size1,
          child: Icon(icon, color: iconColor, size: size1),
        ),
        SizedBox(height: 10),
        Text(title, style: AppTextStyle.heading1),
        SizedBox(height: 4),
        Text(description, style: AppTextStyle.baseStyle),
      ],
    );
  }
}
