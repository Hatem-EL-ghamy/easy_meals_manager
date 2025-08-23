import 'package:flutter/widgets.dart';

// خلفية الـ Onboarding

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imgs/image 39 (1).png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
