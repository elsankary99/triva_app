import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:triva_number/provider/language_provider.dart';
import 'package:triva_number/provider/language_state.dart';

class CustomDropDownButton extends ConsumerWidget {
  const CustomDropDownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageState = ref.watch(languageProvider);
    if (languageState is LanguageLoading) {
      return const CircularProgressIndicator();
    }
    print("+++satate}}");
    final currentLang = ref.watch(languageProvider.notifier).appLanguage;
    return DropdownButton<AppLanguage>(
      value: (currentLang == null) ? AppLanguage.en : currentLang,
      onChanged: (value) {
        if (currentLang == value) {
          return;
        }
        ref.read(languageProvider.notifier).changeLang(value!);
      },
      icon: const Icon(Icons.translate_rounded),
      isExpanded: true,
      items: List.generate(AppLanguage.values.length, (index) {
        return DropdownMenuItem(
          value: AppLanguage.values[index],
          child: Text(AppLanguage.values[index].getLanguage),
        );
      }),
    );
  }
}

enum AppLanguage { ar, en }

extension languageHandler on AppLanguage {
  String get getLanguage {
    switch (this) {
      case AppLanguage.ar:
        return "العربية";

      case AppLanguage.en:
        return "English";
    }
  }
}
