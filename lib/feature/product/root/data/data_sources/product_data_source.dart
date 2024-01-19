import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/network.dart';
import 'product_data_source_imp.dart';

final productDataSourceProvider = Provider(
  (ref) {
    return ProductDataSourceImpl(
      client: ref.read(dioProvider),
    );
  },
);

abstract class ProductDataSource {
  Future<Response> fetchProductList();

  Future<Response> fetchProduct(int id);
}
