import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home_screen/ui/home_screen.dart';
import 'package:meals_app/features/onboarding_servise/onboarding_servise.dart';
import 'package:meals_app/features/onboarding_screen/ui/onboarding_screen.dart';
 

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meals App',
          home: _getInitialScreen(),
        );
      },
    );
  }

  Widget _getInitialScreen() {
    try {
      bool isFirstTime = OnBoardingServices.isFirstTime();
      
      if (isFirstTime) {
        return const OnboardingScreen();
      } else {
        return const HomeScreen();
      }
    } catch (e) {
      return const OnboardingScreen();
    }
  }
}
