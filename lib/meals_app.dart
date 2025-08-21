import 'package:flutter/material.dart';
import 'package:meals_app/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,

      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Meals App',
          routerConfig: AppRouter.goRouter,
        );
      },
    );
  }
}
