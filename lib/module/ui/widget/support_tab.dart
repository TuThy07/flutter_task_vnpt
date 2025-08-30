import 'package:flutter/material.dart';
import 'package:task_3/constant/app_textstyle.dart';

class SupportTab extends StatelessWidget {
  final String title;
  final String subtitle;

  const SupportTab({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(51, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.heading1,
            textAlign: TextAlign.center,
          ),
          Text(
            subtitle,
            style: AppTextStyle.baseStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
