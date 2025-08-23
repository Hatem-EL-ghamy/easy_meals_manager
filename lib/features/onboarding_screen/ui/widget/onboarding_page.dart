import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/onboarding_screen/ui/onboarding_screen.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_icon.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_title.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_description.dart';

// صفحة واحدة من الـ Onboarding

class OnboardingPage extends StatelessWidget {
  final int index;

  const OnboardingPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const OnboardingIcon(),
          SizedBox(height: 50.h),
          OnboardingTitle(title: OnboardingData.titles[index]),
          SizedBox(height: 20.h),
          OnboardingDescription(description: OnboardingData.descriptions[index]),
        ],
      ),
    );
  }
}