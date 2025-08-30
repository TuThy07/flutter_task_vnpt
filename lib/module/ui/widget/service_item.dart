import 'package:flutter/material.dart';
import 'package:task_3/constant/app_textstyle.dart';
import 'package:task_3/constant/app_constant.dart';

class TabService extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String status;
  final String price;

  const TabService({
    super.key,
    required this.title,
    required this.status,
    this.icon,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    // Xác định màu của chấm tròn dựa trên trạng thái
    final Color statusColor =
        status == AppConstants.active ? Colors.green : Colors.yellow;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(51, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.white, size: 28),
                SizedBox(width: 16),
              ] else ...[
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.heading2),
                  SizedBox(height: 4),
                  Text(
                    status,
                    style: AppTextStyle.baseStyle,
                  ),
                ],
              ),
            ],
          ),
          Text(price, style: AppTextStyle.heading2),
        ],
      ),
    );
  }
}