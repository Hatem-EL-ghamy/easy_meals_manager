import 'package:flutter/widgets.dart';
import 'package:meals_app/features/add_meal_screen/ui/add_meal_screen.dart';

// كلاس لإدارة الـ Controllers

class AddMealControllers {
  late final TextEditingController mealNameController;
  late final TextEditingController imageUrlController;
  late final TextEditingController rateController;
  late final TextEditingController timeController;
  late final TextEditingController descriptionController;

  AddMealControllers() {
    mealNameController = TextEditingController();
    imageUrlController = TextEditingController();
    rateController = TextEditingController();
    timeController = TextEditingController();
    descriptionController = TextEditingController();
  }

  void initializeWithDefaults() {
    mealNameController.text = AddMealData.defaultMealName;
    imageUrlController.text = AddMealData.defaultImageUrl;
    rateController.text = AddMealData.defaultRate;
    timeController.text = AddMealData.defaultTime;
    descriptionController.text = AddMealData.defaultDescription;
  }

  void dispose() {
    mealNameController.dispose();
    imageUrlController.dispose();
    rateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
  }
}
