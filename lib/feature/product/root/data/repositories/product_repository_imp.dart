import 'package:dartz/dartz.dart';
import 'package:ecommerece_riverpod/core/network/request_handler.dart';

import '../../../../../core/network/error_model.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product_data_source.dart';
import '../models/product_model.dart';


class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.dataSource});

  final ProductDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<ProductModel>>> productList() async {
    return await dataSource.fetchProductList().guard(
          (data) => (data as List).map((e) {
            return ProductModel.fromJson(e);
          }).toList(),
        );
  }

  @override
  Future<Either<ErrorModel, ProductModel>> product(int id) async {
    return await dataSource
        .fetchProduct(id)
        .guard((data) => ProductModel.fromJson(data));
  }
}
