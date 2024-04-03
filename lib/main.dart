import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/router_config.dart';
import 'core/theme/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeProvider).themeMode;
   // final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'ecommerce',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(goRouterProvider),
      theme: themeMode == ThemeMode.light
          ? ThemeData.light()
          : ThemeData.dark(),
      darkTheme: ThemeData.dark().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700))),
      themeMode: themeMode,
    );
  }
}
