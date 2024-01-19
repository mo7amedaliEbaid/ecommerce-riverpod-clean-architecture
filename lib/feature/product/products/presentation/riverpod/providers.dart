
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/state/base_state.dart';
import '../../../root/data/models/product_model.dart';
import '../../domain/use_cases/products_use_case.dart';
import 'products_notifier.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, BaseState>(
  (ref) {
    return ProductsNotifier(
      ref: ref,
      useCase: ref.watch(productsUseCaseProvider),
    );
  },
);

final productDataProvider = Provider<ProductModel>(
  (ref) => throw UnimplementedError(),
);
