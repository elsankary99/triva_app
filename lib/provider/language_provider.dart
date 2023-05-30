import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/language_menu.dart';
import 'package:triva_number/provider/language_state.dart';
import 'package:triva_number/sharedPrefrance.dart';

final languageProvider =
    StateNotifierProvider<LanguageProvider, LanguageState>((ref) {
  return LanguageProvider();
});

class LanguageProvider extends StateNotifier<LanguageState> {
  LanguageProvider() : super(LanguageInitial());
  AppLanguage? appLanguage;
  void init() {
    appLanguage = SharedPrefHelper.getLanguage();
    state = const LanguageChanged();
  }

  Future<void> changeLang(AppLanguage nextAppLanguage) async {
    state = const LanguageLoading();
    try {
      await SharedPrefHelper.setLanguage(nextAppLanguage.name);
      appLanguage = nextAppLanguage;
      state = const LanguageChanged();
    } catch (e) {
      state = const LanguageError("error while changing the language");
    }
  }
}
