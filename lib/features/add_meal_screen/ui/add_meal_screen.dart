import 'package:flutter/material.dart';
import 'package:meals_app/features/home_screen/ui/home_screen.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_body.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_appBar.dart';
import 'package:meals_app/features/add_meal_screen/ui/widget/add_meal_controllers.dart';

// البيانات الافتراضية للـ Meal
class AddMealData {
  static const String defaultMealName = 'Breakfast';
  static const String defaultImageUrl =
      'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg';
  static const String defaultRate = '4.5';
  static const String defaultTime = '20 - 30';
  static const String defaultDescription = '• first\n• second';
}

// الشاشة الرئيسية لإضافة وجبة
class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  late final AddMealControllers _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = AddMealControllers();
    _controllers.initializeWithDefaults();
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  void _saveMeal() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
    // هنا يمكن إضافة منطق الحفظ
    print('Save meal data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const AddMealAppBar(),
      body: AddMealBody(controllers: _controllers, onSave: _saveMeal),
    );
  }
}
