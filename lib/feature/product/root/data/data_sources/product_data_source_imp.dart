import 'package:dio/dio.dart';

import '../../../../../core/network/rest_client.dart';
import 'product_data_source.dart';

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> fetchProductList() async {
    return await client.get(
      APIType.public,
      'products',
    );
  }

  @override
  Future<Response> fetchProduct(int id) async {
    return await client.get(
      APIType.public,
      'products/$id',
    );
  }
}
