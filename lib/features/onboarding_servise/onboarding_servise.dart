import 'package:shared_preferences/shared_preferences.dart';
 

class OnBoardingServices {
  static late SharedPreferences sharedPrefs;

  static Future<void> InitializeSharedPretrencesStorage() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    bool isFirstTime = sharedPrefs.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  static Future<void> setFirstTimeWithFalse() async {
    await sharedPrefs.setBool('isFirstTime', false);
  }
}
