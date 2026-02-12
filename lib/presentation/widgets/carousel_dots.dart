import 'package:flutter/material.dart';

class CarouselDots extends StatelessWidget {
  final int activeIndex;
  const CarouselDots({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == activeIndex ? Colors.white : Colors.white24,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
