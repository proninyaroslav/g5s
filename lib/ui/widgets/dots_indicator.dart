import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guest5stars/ui/theme.dart';

class DotsIndicator extends StatefulWidget {
  const DotsIndicator({super.key});

  @override
  State<DotsIndicator> createState() => _DotsIndicatorState();
}

class _DotsIndicatorState extends State<DotsIndicator> {
  int activeIndex = 0;
  int direction = 1; // 1 = right, -1 = left
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 300), (t) {
      setState(() {
        activeIndex += direction;
        if (activeIndex == 3) {
          direction = -1;
        } else if (activeIndex == 0) {
          direction = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Color _getColor(int index) {
    int diff = (index - activeIndex).abs();

    switch (diff) {
      case 0:
        return AppPalette.reset;
      case 1:
        return AppPalette.reset.withValues(alpha: 0.5);
      case 2:
        return AppPalette.reset.withValues(alpha: 0.2);
      default:
        return AppPalette.reset.withValues(alpha: 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (i) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getColor(i),
          ),
        );
      }),
    );
  }
}
