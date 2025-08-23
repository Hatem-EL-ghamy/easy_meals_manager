import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 

// مؤشرات الصفحات

class OnboardingPageIndicators extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const OnboardingPageIndicators({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          width: currentIndex == index ? 24.w : 10.w,
          height: 10.h,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? Colors.white
                : Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
