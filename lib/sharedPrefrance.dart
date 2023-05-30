import 'package:shared_preferences/shared_preferences.dart';
import 'package:triva_number/language_menu.dart';

class SharedPrefHelper {
  static late SharedPreferences sharedpref;
  static Future<void> init() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<void> setLanguage(String language) async {
    await sharedpref.setString('lang', language);
  }

  static AppLanguage? getLanguage() {
    final String? lang = sharedpref.getString('lang');
    if (lang != null) {
      for (AppLanguage language in AppLanguage.values) {
        if (language.name == lang) {
          return language;
        }
      }
    }
    return null;
  }
}
