import 'package:flutter/material.dart';
import 'package:task_3/constant/app_icon.dart';

class StepIndicatorWithButtons extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final double dotSize; 

  const StepIndicatorWithButtons({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0x55FFFFFF),
    this.onBack,
    this.onNext,
    this.dotSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: currentStep > 1 ? onBack : null,
          icon: Icon(
            AppIcon.back,
            color: currentStep > 1 ? activeColor : inactiveColor,
            size: 50,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalSteps, (index) {
              bool isActive = index == currentStep;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: dotSize,
                height: dotSize,
                decoration: BoxDecoration(
                  color: isActive ? activeColor : inactiveColor,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
        IconButton(
          onPressed: currentStep < totalSteps  ? onNext : null,
          icon: Icon(
            AppIcon.next,
            color: currentStep < totalSteps ? activeColor : inactiveColor,
            size: 50,
          ),
        ),
      ],
    );
  }
}