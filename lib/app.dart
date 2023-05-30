import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/home.dart';
import 'package:triva_number/l10n/app_localizations.dart';
import 'package:triva_number/provider/language_provider.dart';
import 'package:triva_number/provider/language_state.dart';
import 'package:triva_number/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(languageProvider.select(
      (state) => state is LanguageChanged,
    ));
    // ref.listen(languageProvider, (previous, current) {
    //   if (current is LanguageError) {
    //     FlutterToast.
    //   }
    //  })
    final theme = ref.watch(changeThemeProvider);
    final currentLang = ref.watch(languageProvider.notifier).appLanguage;
    print("state");
    final state = ref.watch(languageProvider);

    return MaterialApp(
      locale: (currentLang == null) ? null : Locale(currentLang.name),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: localeResolution,
      theme: theme ? lightTheme : darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

  Locale localeResolution(locale, supportedLocales) {
    if (locale == null) {
      return supportedLocales.last;
    }
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.last;
  }
}
