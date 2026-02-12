import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentIndex;

  const StepIndicator({
    super.key,
    required this.currentIndex,
  });

  static const int _totalSteps = 6;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _totalSteps,
        (index) {
          final stepNumber = index + 1;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: stepNumber == currentIndex ? 10 : 8,
            height: stepNumber == currentIndex ? 10 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: stepNumber <= currentIndex
                  ? Colors.white
                  : Colors.grey[800],
            ),
          );
        },
      ),
    );
  }
}
