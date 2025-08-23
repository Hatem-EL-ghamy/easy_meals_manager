import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/routers_string.dart';
import 'package:meals_app/features/home_screen/ui/home_screen.dart';
import 'package:meals_app/features/add_meal_screen/ui/add_meal_screen.dart';
import 'package:meals_app/features/onboarding_screen/ui/onboarding_screen.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: RoutersString.OnBoardingScreen,
    routes: [
      GoRoute(
        path: RoutersString.OnBoardingScreen,
        name: RoutersString.OnBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RoutersString.HomeScreen,
        name: RoutersString.HomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
         GoRoute(
        path: RoutersString.AddMealScreen,
        name: RoutersString.AddMealScreen,
        builder: (context, state) => const AddMealScreen(),
      ),
    ],
  );
}
