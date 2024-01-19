import 'dart:developer';


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../root/data/models/product_model.dart';
import '../../domain/use_cases/product_details_use_case.dart';

final productDetailsProvider =
    FutureProvider.autoDispose.family<ProductModel?, int>(
  (ref, value) async {
    try {
      final result =
          await ref.read(productDetailsUseCaseProvider).product(value);

      return result.fold(
        (l) => null,
        (r) {
          ref.keepAlive();
          return r;
        },
      );
    } catch (e, stackTrace) {
      log(
        'productDetailsProvider.futureProvider',
        error: e,
        stackTrace: stackTrace,
      );
    }

    return null;
  },
);
