import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// وصف الصفحة

class OnboardingDescription extends StatelessWidget {
  final String description;

  const OnboardingDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          height: 1.5,
          fontWeight: FontWeight.w400,
          shadows: [
            Shadow(
              offset: const Offset(0, 1),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}