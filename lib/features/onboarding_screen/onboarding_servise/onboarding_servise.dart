import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices {
  static late SharedPreferences sharedPrefs;

  static Future InitializeSharedPretrencesStorage() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    bool isFirstTime = sharedPrefs.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  static void setFirstTimeWithFalse() {
    sharedPrefs.setBool('isFirstTime', false);
  }
}
