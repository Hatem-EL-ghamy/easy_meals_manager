import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// أيقونة الصفحة

class OnboardingIcon extends StatelessWidget {
  const OnboardingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(
        Icons.restaurant_menu,
        size: 60.sp,
        color: Colors.white,
        shadows: [
          Shadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
