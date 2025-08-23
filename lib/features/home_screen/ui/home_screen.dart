import 'package:flutter/material.dart';
import 'package:meals_app/core/theming/app_colors.dart';
import 'package:meals_app/core/theming/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/add_meal_screen/ui/add_meal_screen.dart';
import 'package:meals_app/features/home_screen/ui/widget/custom_food_item.dart';
import 'package:meals_app/features/home_screen/ui/widget/custom_top_home-part.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePart(),
            SizedBox(height: 25.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your Food', style: AppStyles.black16Medium),
            ),
            CustomFoodItem(), // ✅ هي Expanded من جوا
            Padding(
              padding: const EdgeInsets.only(left: 310),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddMealScreen(),
                    ),
                  );
                },
                shape: CircleBorder(),
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                  size: 30.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
