import 'package:flutter/widgets.dart';
import 'package:meals_app/meals_app.dart';
import 'package:meals_app/features/onboarding_servise/onboarding_servise.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnBoardingServices.InitializeSharedPretrencesStorage();
  runApp(const MealsApp());
}
