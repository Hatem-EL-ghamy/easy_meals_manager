import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_controllers.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_form_fields.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_save_button.dart';

// محتوى الشاشة

class AddMealBody extends StatelessWidget {
  final AddMealControllers controllers;
  final VoidCallback onSave;

  const AddMealBody({
    super.key,
    required this.controllers,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddMealFormFields(controllers: controllers),
          SizedBox(height: 40.h),
          AddMealSaveButton(onSave: onSave),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}