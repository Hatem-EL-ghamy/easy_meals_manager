import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// الطبقة المظلمة للتباين

class OnboardingOverlay extends StatelessWidget {
  const OnboardingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
    );
  }
}
