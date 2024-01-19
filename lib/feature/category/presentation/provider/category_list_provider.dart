import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/category_use_case.dart';

final selectedCategoryProvider = StateProvider<String>((ref) => '');

final categoriesProvider = FutureProvider<List<String>>(
  (ref) async {
    final categories = await ref.watch(categoryUseCaseProvider).categories();

    return categories.fold(
      (l) {
        log(
          'categoriesProvider',
          error: l,
        );
        return [];
      },
      (r) => r,
    );
  },
);
