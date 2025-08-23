import 'package:flutter/material.dart';
import 'package:meals_app/core/theming/app_colors.dart';
import 'package:meals_app/core/theming/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// تسمية الحقل

class AddMealFieldLabel extends StatelessWidget {
  final String label;

  const AddMealFieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppStyles.black16Medium);
  }
}

// حقل النص
class AddMealTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;

  const AddMealTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}