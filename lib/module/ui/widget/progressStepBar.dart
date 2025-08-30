import 'package:flutter/material.dart';

class Progressstepbar extends StatelessWidget {
  final int totalStep;
  final int currentStep;
  final double height;
  final Color completedColor;
  final Color currentColor;
  final Color uncompletedColor;
  final double itemWidth; // Thêm thuộc tính này

  const Progressstepbar({
    super.key,
    required this.currentStep,
    required this.totalStep,
    this.height = 8,
    this.completedColor = Colors.white,
    this.currentColor = const Color(0x55FFFFFF),
    this.uncompletedColor = const Color(0x55FFFFFF),
    this.itemWidth = 60, // Giá trị mặc định cho chiều rộng
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalStep, (index) {
        bool isCompleted = index < currentStep - 1;
        bool isCurrent = index == currentStep - 1;
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: itemWidth, // Sử dụng chiều rộng cố định
          height: height,
          decoration: BoxDecoration(
            color: isCompleted
                ? completedColor
                : isCurrent
                    ? currentColor
                    : uncompletedColor,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}