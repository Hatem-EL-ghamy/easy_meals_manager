import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// زر التخطي

class OnboardingSkipButton extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onSkip;

  const OnboardingSkipButton({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    if (currentIndex == totalPages - 1) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: GestureDetector(
          onTap: onSkip,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    offset: const Offset(0, 1),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}