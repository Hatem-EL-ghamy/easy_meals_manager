import 'package:flutter/material.dart';
import 'package:meals_app/features/home_screen/ui/home_screen.dart';
import 'package:meals_app/features/onboarding_servise/onboarding_servise.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_overlay.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_page_view.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_background.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_skip_button.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/Onboarding_bottom_section.dart';

// البيانات الثابتة
class OnboardingData {
  static const List<String> titles = [
    "Save Your Meals Ingredient",
    "Use Our App The Best Choice",
    "Our App Your Ultimate Choice",
  ];

  static const List<String> descriptions = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "The best choice for your kitchen, do not hesitate",
    "All the best restaurants and their top menus are ready for you",
  ];
}

// الشاشة الرئيسية للـ Onboarding
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _goToHome() async {
    await OnBoardingServices.setFirstTimeWithFalse();
    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _nextPage() {
    if (currentIndex < OnboardingData.titles.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnboardingBackground(),
          const OnboardingOverlay(),
          SafeArea(
            child: Column(
              children: [
                OnboardingSkipButton(
                  currentIndex: currentIndex,
                  totalPages: OnboardingData.titles.length,
                  onSkip: _goToHome,
                ),
                OnboardingPageView(
                  pageController: pageController,
                  onPageChanged:
                      (index) => setState(() => currentIndex = index),
                ),
                OnboardingBottomSection(
                  currentIndex: currentIndex,
                  totalPages: OnboardingData.titles.length,
                  onNext: _nextPage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
