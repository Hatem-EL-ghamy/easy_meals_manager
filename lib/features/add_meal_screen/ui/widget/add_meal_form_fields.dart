import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_controllers.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_input_field.dart';

// حقول النموذج

class AddMealFormFields extends StatelessWidget {
  final AddMealControllers controllers;

  const AddMealFormFields({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddMealInputField(
          label: 'Meal Name',
          controller: controllers.mealNameController,
        ),
        SizedBox(height: 20.h),
        AddMealInputField(
          label: 'Image URL',
          controller: controllers.imageUrlController,
          maxLines: 3,
        ),
        SizedBox(height: 20.h),
        AddMealInputField(
          label: 'Rate',
          controller: controllers.rateController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        SizedBox(height: 20.h),
        AddMealInputField(
          label: 'Time',
          controller: controllers.timeController,
        ),
        SizedBox(height: 20.h),
        AddMealInputField(
          label: 'Description',
          controller: controllers.descriptionController,
          maxLines: 6,
        ),
      ],
    );
  }
}