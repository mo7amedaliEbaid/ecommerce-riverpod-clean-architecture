import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/router_config.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      title: 'ecommerce',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(goRouterProvider),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}