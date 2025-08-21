import 'package:flutter/material.dart';
import 'package:meals_app/meals_app.dart';
import 'package:meals_app/features/onboarding_screen/onboarding_servise/onboarding_servise.dart';

// void main() {
//   runApp(const MealsApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnBoardingServices.InitializeSharedPretrencesStorage();
  runApp(const MealsApp());
}
