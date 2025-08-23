import 'package:flutter/widgets.dart';
import 'package:meals_app/features/onboarding_screen/ui/onboarding_screen.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_page.dart';

// PageView للصفحات

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: OnboardingData.titles.length,
        itemBuilder: (context, index) => OnboardingPage(index: index),
      ),
    );
  }
}
