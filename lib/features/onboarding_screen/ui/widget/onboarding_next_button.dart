import 'package:flutter/material.dart';
import 'package:meals_app/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// زر التالي/البدء

class OnboardingNextButton extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;

  const OnboardingNextButton({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNext,
      child: Container(
        width: double.infinity,
        height: 55.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            currentIndex == totalPages - 1 ? 'Get Started' : 'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}