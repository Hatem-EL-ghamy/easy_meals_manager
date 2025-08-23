import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_next_button.dart';
import 'package:meals_app/features/onboarding_screen/ui/widget/onboarding_page_indicators.dart';

// الجزء السفلي (المؤشرات والزر)

class OnboardingBottomSection extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;

  const OnboardingBottomSection({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          OnboardingPageIndicators(
            currentIndex: currentIndex,
            totalPages: totalPages,
          ),
          SizedBox(height: 30.h),
          OnboardingNextButton(
            currentIndex: currentIndex,
            totalPages: totalPages,
            onNext: onNext,
          ),
        ],
      ),
    );
  }
}
