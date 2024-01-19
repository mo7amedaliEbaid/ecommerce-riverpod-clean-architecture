import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/error_model.dart';
import '../../../root/data/models/product_model.dart';
import '../../../root/domain/repositories/product_repository.dart';

final productsUseCaseProvider = Provider(
  (ref) {
    return ProductsUseCase(
      ref.read(productRepositoryProvider),
    );
  },
);

class ProductsUseCase {
  ProductsUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<ErrorModel, List<ProductModel>>> productList() async {
    return await _repository.productList();
  }
}
