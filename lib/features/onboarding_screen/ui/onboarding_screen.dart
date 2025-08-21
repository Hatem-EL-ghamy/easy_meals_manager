import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meals_app/core/routing/app_router.dart';
import 'package:meals_app/core/theming/app_colors.dart';
import 'package:meals_app/core/theming/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/features/home_screen/ui/home_screen.dart';
import 'package:meals_app/features/onboarding_screen/onboarding_servise/onboarding_servise.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// النصوص الخاصة بالـ Onboarding
List<String> titles = [
  "Save Your Meals Ingredient",
  "Use Our App The Best Choice",
  "Our App Your Ultimate Choice",
];

List<String> descriptions = [
  "Add Your Meals and its Ingredients and we will save it for you",
  "The best choice for your kitchen, do not hesitate",
  "All the best restaurants and their top menus are ready for you",
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isFirstTime = OnBoardingServices.isFirstTime();
      // log(isFirstTime.toString());
      OnBoardingServices.setFirstTimeWithFalse();

      if (isFirstTime == false) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  void _goToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // الخلفية
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/image 7.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // الكارد
            Positioned(
              bottom: 16.h,
              right: 32.w,
              left: 32.w,
              child: Container(
                width: 311.w,
                height: 400.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(43.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الكاروسيل (بدون كونترولار)
                    CarouselSlider.builder(
                      key: ValueKey<int>(
                        currentIndex,
                      ), // يجبر إعادة البناء على الصفحة الحالية
                      options: CarouselOptions(
                        initialPage: currentIndex, // ابدأ من الصفحة الحالية
                        height: 250.h,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() => currentIndex = index);
                        },
                      ),
                      itemCount: titles.length,
                      itemBuilder: (context, index, realIdx) {
                        return SizedBox(
                          width: 252.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                titles[index],
                                textAlign: TextAlign.center,
                                style: AppStyles.onboardingTitleStyle,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                descriptions[index],
                                textAlign: TextAlign.center,
                                style: AppStyles.onboardingDescriptionStyle,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    // المؤشرات (dots)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        titles.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: currentIndex == index ? 20.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color:
                                currentIndex == index
                                    ? Colors.white
                                    : Colors.white54,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    // الأزرار (Skip / Next / Get Started)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Skip (يختفي في الصفحة الأخيرة)
                        if (currentIndex != titles.length - 1)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'Skip',
                                style: AppStyles.white14SemiBold,
                              ),
                            ),
                          ),
                        // Next أو Get Started (بدون كونترولار)
                        InkWell(
                          onTap: () {
                            if (currentIndex == titles.length - 1) {
                              // لو الصفحة الأخيرة → روح للـ HomeScreen
                              _goToHome(context);
                            } else {
                              // غير كده → انتقل للصفحة اللي بعدها
                              setState(() {
                                currentIndex = (currentIndex + 1).clamp(
                                  0,
                                  titles.length - 1,
                                );
                              });
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              currentIndex == titles.length - 1
                                  ? 'Get Started'
                                  : 'Next',
                              style: AppStyles.white14SemiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
