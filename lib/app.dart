import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/home.dart';
import 'package:triva_number/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(changeThemeProvider);
    return MaterialApp(
      theme: theme ? lightTheme : darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
