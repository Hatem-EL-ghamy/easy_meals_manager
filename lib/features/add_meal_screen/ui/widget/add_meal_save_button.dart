import 'package:flutter/material.dart';
import 'package:meals_app/core/theming/app_colors.dart';
import 'package:meals_app/core/theming/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 

// زر الحفظ

class AddMealSaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const AddMealSaveButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          elevation: 0,
        ),
        child: Text('Save', style: AppStyles.white14SemiBold),
      ),
    );
  }
}

// إضافية: Widget للـ Validation (يمكن إضافتها لاحقاً)
class AddMealValidator {
  static String? validateMealName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter meal name';
    }
    return null;
  }

  static String? validateRate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter rate';
    }
    final rate = double.tryParse(value);
    if (rate == null || rate < 0 || rate > 5) {
      return 'Rate must be between 0 and 5';
    }
    return null;
  }

  static String? validateImageUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter image URL';
    }
    // يمكن إضافة validation أكثر تعقيداً هنا
    return null;
  }
}