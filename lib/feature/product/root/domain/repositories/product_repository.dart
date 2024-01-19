import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/error_model.dart';
import '../../data/data_sources/product_data_source.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository_imp.dart';

final productRepositoryProvider = Provider(
  (ref) {
    return ProductRepositoryImpl(
      dataSource: ref.read(productDataSourceProvider),
    );
  },
);

abstract class ProductRepository {
  Future<Either<ErrorModel, List<ProductModel>>> productList();

  Future<Either<ErrorModel, ProductModel>> product(int id);
}
