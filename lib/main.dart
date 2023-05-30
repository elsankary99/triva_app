import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/app.dart';
import 'package:triva_number/provider/language_provider.dart';
import 'package:triva_number/sharedPrefrance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  final container = ProviderContainer();
  container.read(languageProvider.notifier).init();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
