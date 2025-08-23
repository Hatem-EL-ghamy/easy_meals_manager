import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_field_label.dart';

// حقل الإدخال المخصص

class AddMealInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;

  const AddMealInputField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddMealFieldLabel(label: label),
        SizedBox(height: 8.h),
        AddMealTextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}